# The Computer Language Benchmarks Game - Mandelbrot

Recently I discovered [The Computer Language Benchmarks Game](http://benchmarksgame.alioth.debian.org/) which intrigued me, especially the [mandelbrot version](http://benchmarksgame.alioth.debian.org/u64q/mandelbrot.html).

The mandelbrot set is computed by determining if repeated applications of `Z' = Z^2 + C` tends towards infinity or not.

`Z` is a complex number which can be thought of a 2D coordinate. Each pixel in an image is mapped to complex number `Z` and for each pixel we do the infinity test.

In F# the mandelbrot infinity test could look like this:

```fsharp
let rec mandelbrot rem x y cx cy =
  // If the length of (x,y) is greater than 2 the series will tend to infinity
  if rem <= 0 || (x*x + y*y > 4.) then rem
  else mandelbrot (rem - 1) (x*x - y*y + cx)  (2.*x*y + cy) cx cy
```

A complete F# program to generate the mandelbrot set as Black&White PBM image could look like this:

```fsharp
let clock =
  let sw = System.Diagnostics.Stopwatch ()
  sw.Start ()
  fun () -> sw.ElapsedMilliseconds

let timeIt a =
  System.GC.Collect (2, System.GCCollectionMode.Forced, true)

  let inline cc g       = System.GC.CollectionCount g
  let bcc0, bcc1, bcc2  = cc 0, cc 1, cc 2
  let before            = clock ()

  let r                 = a ()

  let after             = clock ()
  let acc0, acc1, acc2  = cc 0, cc 1, cc 2

  after - before, acc0 - bcc0, acc1 - bcc1, acc2 - bcc2, r


[<EntryPoint>]
let main argv =
  // Argument is the desired x/y size of the set
  let dim     =
    let dim = if argv.Length > 0 then int argv.[0] else 200
    max dim 200
  let dimf    = float dim
  let width   = (dim + 7) / 8

  // What part of the mandelbrot set is rendered
  let minX    = -1.5
  let minY    = -1.0
  let maxX    =  0.5
  let maxY    =  1.0
  // More iterations means a more accurate visualization of the mandelbrot set
  let maxIter =  50

  let scalex  = (maxX - minX) / dimf;
  let scaley  = (maxY - minY) / dimf;

  let pixels  = Array.zeroCreate (width*dim)

  let mandelbrotSet () =
    for y = 0 to (dim - 1) do
      let yoffset = y*width
      for w = 0 to (width - 1) do
        let mutable bits = 0uy
        for b = 0 to 7 do
          // The mandelbrot equation: Z' = Z^2 + C
          let rec mandelbrot rem x y cx cy =
            if rem <= 0 || (x*x + y*y > 4.) then rem
            else mandelbrot (rem - 1) (x*x - y*y + cx)  (2.*x*y + cy) cx cy

          let x   = w*8 + b
          let cx  = scalex*(float x) + minX
          let cy  = scaley*(float y) + minY

          let rem = mandelbrot maxIter cx cy cx cy

          if rem = 0 then
            // If we ran out of time we assume the point belongs to the mandelbrot set
            bits    <- bits ||| (1uy <<< (7 - b))

        pixels.[yoffset + w] <- bits

  printfn "Generating mandelbrot set: %dx%d(%d)" dim dim maxIter
  let ms, cc0, cc1, cc2, _ = timeIt mandelbrotSet
  printfn "  ... generating mandelbrot set: %d ms, (%d, %d, %d) GC" ms cc0 cc1 cc2

  // Writes the pixels as PBM
  //  Can be viewed using: http://paulcuth.me.uk/netpbm-viewer/
  do
    use fs = System.IO.File.Create "mandelbrot_fsharp.pbm"
    use ss = new System.IO.StreamWriter (fs)
    ss.Write (sprintf "P4\n%d %d\n" dim dim)
    ss.Flush ()
    fs.Write (pixels, 0, pixels.Length)

  0
```

The results of the program can be viewed using: http://paulcuth.me.uk/netpbm-viewer/

At the benchmark site the [`mandelbrot_6`](http://benchmarksgame.alioth.debian.org/u64q/program.php?test=mandelbrot&lang=gcc&id=6) generates a 16,000x16,000 mandelbrot set in 1.65 sec.

The F# program generates the same set in 28 sec on my machine, roughly 17x times slower.

## Can the best algorithm be beaten?

I analyzed the `mandelbrot_6` program to understand if it can be improved upon.

`mandelbrot_6` is written in C and uses all cores available through OpenMP to get a roughly 4x speedup on quad core machines such as mine. In addition the program uses SSE3 in order to compute two pixels in parallel.

If we used AVX over SSE3 it would gives us twice the computation power. In addition, for the coordinates choses we don't need really need double precision floats, if we used single precision floats we could process eight pixels in parallel.

This makes me believe that `mandelbrot_6` could be made 4x times faster by using AVX (2x) and single precision floats (2x).

Another, approach is to use the GPU but that is a topic for a another post.

.NET has limited support for SSE and no support for AVX which means I will use C++.

## Generating the mandelbrot set using AVX

I have written an AVX accelerated mandelbrot set generator previously:

```C++
  inline __m256d mandelbrot_avx (__m256d x, __m256d y, __m256d cx, __m256d cy, std::size_t max_iter)
  {
    auto acc = _mm256_set1_pd (0.0);

    for (std::size_t iter = max_iter; iter > 0; --iter)
    {
      auto x2         = _mm256_mul_pd  (x, x);                // x*x      (4 doubles)
      auto y2         = _mm256_mul_pd  (y, y);                // y*y      (4 doubles)
      auto r2         = _mm256_add_pd  (x2, y2);              // x2 + y2  (4 doubles)
      auto _4         = _mm256_set1_pd (4.0);                 // 4.0      (4 doubles)
      auto cmp        = _mm256_cmp_pd  (r2, _4, _CMP_LT_OQ);  // r2 < 4   (4 doubles)

      // Using the parallel comparison we generate a comparison mask
      //  where the 4 lower bits holds the result of the comparison
      auto cmp_mask   = _mm256_movemask_pd (cmp);

      // If all bits are 0 it means all comparisons where greater than 4. so we can bail
      if (!cmp_mask)
      {
        return acc;
      }

      auto _1         = _mm256_set1_pd (1.0);           // 1.0      (4 doubles)
      auto _0         = _mm256_set1_pd (0.0);           // 0.0      (4 doubles)
      auto inc        = _mm256_blendv_pd (_0, _1, cmp); // blends _1 and _0 depending on the comparison result
      acc             = _mm256_add_pd (acc, inc);       // ++acc    (4 doubles)

      // Compute new x & y values
      auto xy       = _mm256_mul_pd (x, y);                         // x*y      (4 doubles)
      y             = _mm256_add_pd (_mm256_add_pd (xy, xy) , cy);  // xy + xy  (4 doubles)
      x             = _mm256_add_pd (_mm256_sub_pd (x2, y2) , cx);  // x2 - y2  (4 doubles)
    }

    return acc;
  }
```

This keeps track of how many iterations it took before it was determined that the point didn't belong the mandelbrot set. This is often used to color the mandelbrot set.

However, for the purpose of this exercise this is unnecessary as we will generate a black & white set, so it can be rewritten into this:

```C++
  inline int mandelbrot_avx (__m256 x, __m256 y, __m256 cx, __m256 cy, std::size_t max_iter)
  {
    int cmp_mask = 0;

    for (std::size_t iter = max_iter; iter > 0; --iter)
    {
      auto x2         = _mm256_mul_ps  (x, x);
      auto y2         = _mm256_mul_ps  (y, y);
      auto r2         = _mm256_add_ps  (x2, y2);
      auto _4         = _mm256_set1_ps (4.0);
      auto cmp        = _mm256_cmp_ps  (r2, _4, _CMP_LT_OQ);
      cmp_mask        = _mm256_movemask_ps (cmp);

      if (!cmp_mask)
      {
        return 0;
      }

      auto xy       = _mm256_mul_ps (x, y);
      y             = _mm256_add_ps (_mm256_add_ps (xy, xy) , cy);
      x             = _mm256_add_ps (_mm256_sub_ps (x2, y2) , cx);
    }

    return 0;
  }
```

We also switched to single-precision floats.

So by processing 8 pixels at the time rather than 2 pixels at the time we would expect this to perform roughly 4x faster than `mandelbrot_6`. In order utilize multiple cores I use OpenMP which is supported by Visual Studio, GCC and CLANG.

## Results

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.3s  | 1x      |
| F# (reference)    | 28s   | -17x    |
| C++ (reference)   | 24s   | ?x      |
| C++ (AVX)         | _     | ?x      |
| C++ (unroll)      | _     | ?x      |
| C++ (multiple)    | _     | ?x      |

## Appendix

### FSharp code disassembled

```asm
; rem <= 0?
00007FFAE53F1BA6  test        esi,esi
;  if so then bail out
00007FFAE53F1BA8  jle         00007FFAE53F1BCE
; x2 = x*x
00007FFAE53F1BAA  movaps      xmm0,xmm6
00007FFAE53F1BAD  mulsd       xmm0,xmm6
; y2 = y*y
00007FFAE53F1BB1  movaps      xmm1,xmm7
00007FFAE53F1BB4  mulsd       xmm1,xmm7
; r2 = x2 + y2
00007FFAE53F1BB8  addsd       xmm0,xmm1
; r2 > 4.?
00007FFAE53F1BBC  ucomisd     xmm0,mmword ptr [7FFAE53F1C20h]
00007FFAE53F1BC4  seta        al
00007FFAE53F1BC7  movzx       eax,al
00007FFAE53F1BCA  test        eax,eax
; if no > 4. then continue
00007FFAE53F1BCC  je          00007FFAE53F1BEC
; We are done
00007FFAE53F1BCE  ...
; x2 = x*x
00007FFAE53F1BEC  movaps      xmm0,xmm6
00007FFAE53F1BEF  mulsd       xmm0,xmm6
; y2 = y*y
00007FFAE53F1BF3  movaps      xmm1,xmm7
00007FFAE53F1BF6  mulsd       xmm1,xmm7
; x = x2 - y2 + cx
00007FFAE53F1BFA  subsd       xmm0,xmm1
00007FFAE53F1BFE  addsd       xmm0,xmm8
; y = 2*x*y + cy
00007FFAE53F1C03  mulsd       xmm6,mmword ptr [7FFAE53F1C28h]
00007FFAE53F1C0B  mulsd       xmm6,xmm7
00007FFAE53F1C0F  movaps      xmm7,xmm6
00007FFAE53F1C12  addsd       xmm7,xmm9
00007FFAE53F1C17  movaps      xmm6,xmm0
; rem - 1
00007FFAE53F1C1A  dec         esi
00007FFAE53F1C1C  jmp         00007FFAE53F1BA1
```