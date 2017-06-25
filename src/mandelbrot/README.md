# The Computer Language Benchmarks Game - Mandelbrot

**Source code: https://github.com/mrange/benchmarksgame/tree/master/src/mandelbrot**

**Update 2017-06-25 - Decided I could do a bit better with F# so added an improved F# program that uses the .NET SSE**

Recently I discovered [The Computer Language Benchmarks Game](http://benchmarksgame.alioth.debian.org/) which intrigued me, especially the [mandelbrot version](http://benchmarksgame.alioth.debian.org/u64q/mandelbrot.html).

The mandelbrot set is computed by determining if repeated applications of `Z' = Z^2 + C` tends towards infinity or not.

`Z` is a complex number which can be thought of a 2D coordinate. In order to visualize the mandelbrot set each pixel in an image can be mapped to complex number `Z` and for each pixel we do the infinity test. If the series tend to infinity we color the pixel white, black otherwise.

It's a problem that easy to parallelize as each pixel is independent of the others.

In F# the mandelbrot infinity test could look like this:

```fsharp
let rec mandelbrot rem x y cx cy =
  // If the length of (x,y) is greater than 2 the series will tend to infinity
  if rem <= 0 || (x*x + y*y > 4.) then rem
  else mandelbrot (rem - 1) (x*x - y*y + cx)  (2.*x*y + cy) cx cy
```

A complete F# program to generate the mandelbrot set as a black & white PBM image could look like this:

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

For fun let's look at the generated assembly code:

```asm
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

It's not too bad but one see that `x*x` and `y*y` is computed twice and the exit condition could be done better.

The results of the program can be viewed using: http://paulcuth.me.uk/netpbm-viewer/

The best algrorithm at the  site is [`mandelbrot_6`](http://benchmarksgame.alioth.debian.org/u64q/program.php?test=mandelbrot&lang=gcc&id=6) that generates a 16,000x16,000 mandelbrot set in 1.13 sec.

The F# program generates the same set in 28 sec on my machine, roughly 25x times slower as seen in the table below.

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.13s | 1x      |
| F# (reference)    | 28s   | -25x    |


## Can the best algorithm be beaten?

The best algorithm on the site is `mandelbrot_6`. I analyzed the `mandelbrot_6` program to understand if it can be improved upon.

`mandelbrot_6` is written in C and uses all cores available through OpenMP to get a roughly 4x speedup on quad core machines. In addition the program uses SSE3 in order to compute two pixels in parallel. SSE3 is an example of SIMD (single instruction, multiple data).

If we used AVX over SSE3 it would give us twice the computation power. In addition, for the coordinates chosen we don't need double precision floats, if we used single precision floats we could process eight pixels in parallel.

This makes me believe that `mandelbrot_6` could be made 4x times faster by using AVX (2x) and single precision floats (2x).

Another, approach is to use the GPU but that is a topic for another post.

.NET has limited support for SSE and no support for AVX which means I will use C++.

## Creating a reference mandelbrot set generator

I think it's useful to always compare against a trivial implementation like the F# version above but as we are going to use C++ going forward we need one for C++ as well

```c++
  auto mandelbrot (double cx, double cy)
  {
    auto x    = cx      ;
    auto y    = cy      ;
    auto iter = max_iter;
    for (; iter > 0; --iter)
    {
      auto x2 = x*x;
      auto y2 = y*y;
      if (x2 + y2 > 4)
      {
        return iter;
      }
      y = 2*x*y   + cy  ;
      x = x2 - y2 + cx  ;
    }

    return iter;
  }
```

The assembly code:

```asm
; auto x2 = x*x;
00007FF70A371111  movaps      xmm2,xmm1
00007FF70A371114  mulsd       xmm2,xmm1
; auto y2 = y*y;
00007FF70A371118  movaps      xmm3,xmm4
00007FF70A37111B  mulsd       xmm3,xmm4
; if (x2 + y2 > 4)
; {
;   return iter;
; }
00007FF70A37111F  movaps      xmm0,xmm3
00007FF70A371122  addsd       xmm0,xmm2
00007FF70A371126  comisd      xmm0,xmm7
00007FF70A37112A  ja          `anonymous namespace'::compute_set+14Bh (07FF70A37114Bh)
; y = 2*x*y   + cy  ;
00007FF70A37112C  addsd       xmm1,xmm1
00007FF70A371130  mulsd       xmm1,xmm4
00007FF70A371134  movaps      xmm4,xmm1
00007FF70A371137  addsd       xmm4,xmm6
; x = x2 - y2 + cx  ;
00007FF70A37113B  movaps      xmm1,xmm2
00007FF70A37113E  subsd       xmm1,xmm3
00007FF70A371142  addsd       xmm1,xmm5
; for (; iter > 0; --iter)
00007FF70A371146  add         eax,0FFFFFFFFh
00007FF70A371149  jne         `anonymous namespace'::compute_set+111h (07FF70A371111h)
```

The code looks slightly better than the F# code and the results are slightly better too:

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.13s | 1x      |
| F# (reference)    | 28s   | -25x    |
| C++ (reference)   | 22s   | -20x    |

## Generating the mandelbrot set using AVX

I have written an AVX accelerated mandelbrot set generator previously:

```C++
  inline __m256d mandelbrot_avx (__m256d cx, __m256d cy, std::size_t max_iter)
  {
    auto x = cx;
    auto y = cy;

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
  inline int mandelbrot_avx (__m256 cx, __m256 cy, std::size_t max_iter)
  {
    auto x = cx;
    auto y = cy;

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

    return cmp_mask;
  }
```

We also switched to single-precision floats.

So by processing 8 pixels at the time rather than 2 pixels at the time we would expect this to perform roughly 4x faster than `mandelbrot_6`. In order utilize multiple cores I use OpenMP which is supported by Visual Studio, GCC and CLANG.

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.13s | 1x      |
| F# (reference)    | 28s   | -25x    |
| C++ (reference)   | 22s   | -20x    |
| C++ (AVX)         | 790ms | 1.4x    |

We are using floats and AVX so we expect the speedup to be around 4x compared to `mandelbrot_6` but when running the tests we only get around 40% performance improvement. Disappointing.

Let's check the generated assembly code to see if anything interesting can be seen.

```asm
; auto x2         = _mm256_mul_ps  (x, x);
00007FF764B21050  vmulps      ymm5,ymm3,ymm3
; auto y2         = _mm256_mul_ps  (y, y);
00007FF764B21054  vmulps      ymm1,ymm4,ymm4
; auto r2         = _mm256_add_ps  (x2, y2);
00007FF764B21058  vaddps      ymm0,ymm1,ymm5
; auto cmp        = _mm256_cmp_ps  (r2, _4, _CMP_LT_OQ);
00007FF764B2105C  vcmplt_oqps ymm2,ymm0,ymm7
; cmp_mask        = _mm256_movemask_ps (cmp);
00007FF764B21061  vmovmskps   eax,ymm2
; if (!cmp_mask)
; {
;   return 0;
; }
00007FF764B21065  test        eax,eax
00007FF764B21067  je          `anonymous namespace'::mandelbrot_avx+85h (07FF764B21085h)
; auto xy       = _mm256_mul_ps (x, y);
00007FF764B21069  vmulps      ymm0,ymm4,ymm3
; y             = _mm256_add_ps (_mm256_add_ps (xy, xy) , cy);
; x             = _mm256_add_ps (_mm256_sub_ps (x2, y2) , cx);
00007FF764B2106D  vaddps      ymm2,ymm0,ymm0
00007FF764B21071  vsubps      ymm0,ymm5,ymm1
00007FF764B21075  vaddps      ymm3,ymm0,ymm11
00007FF764B2107A  vaddps      ymm4,ymm2,ymm10
; for (std::size_t iter = max_iter; iter > 0; --iter)
00007FF764B2107F  sub         rdx,1
00007FF764B21083  jne         `anonymous namespace'::mandelbrot_avx+50h (07FF764B21050h)
```

The code basically maps directly to the C++ code and we don't see unexpected overhead. However, the compiler hasn't unrolled the loop for us.

## Unrolling loops for performance

When checking the code for `mandelbrot_6` I noted that they write the code in such a way to allow it to unroll the inner loop 8 times. In addition, they only do the infinity check after the 8 iterations. This mean we might do a bit of unnecessary work but the inner loop will be tighter and we reduce the overhead of the end of loop check.

```c++
// Visual C++ is very restrictive with unrolling loops so this is a way to force unrolling
#define MANDEL_INNER()                                    \
        x2 = _mm256_mul_ps  (x, x);                       \
        y2 = _mm256_mul_ps  (y, y);                       \
        r2 = _mm256_add_ps  (x2, y2);                     \
        xy = _mm256_mul_ps  (x, y);                       \
        y  = _mm256_add_ps (_mm256_add_ps (xy, xy) , cy); \
        x  = _mm256_add_ps (_mm256_sub_ps (x2, y2) , cx);

#define MANDEL_CHECK()                                    \
        auto cmp        = _mm256_cmp_ps  (r2, _mm256_set1_ps (4.0), _CMP_LT_OQ);  \
        cmp_mask        = _mm256_movemask_ps (cmp);

  inline int mandelbrot_avx (__m256 cx, __m256 cy, std::size_t max_iter)
  {
    auto x = cx;
    auto y = cy;

    int cmp_mask = 0;

    __m256 x2, y2, xy, r2;

    // 6 outer loops
    for (auto outer = 6; outer > 0; --outer)
    {
      // 8 inner "loops"
      MANDEL_INNER()
      MANDEL_INNER()
      MANDEL_INNER()
      MANDEL_INNER()
      MANDEL_INNER()
      MANDEL_INNER()
      MANDEL_INNER()
      MANDEL_INNER()

      // Infinity check only every 8th iteration
      MANDEL_CHECK ();

      if (!cmp_mask)
      {
        return 0;
      }

    }

    // As 6*8 = 48 then 2 more inner "loops" before computing the final result

    MANDEL_INNER()
    MANDEL_INNER()

    MANDEL_CHECK ();

    return cmp_mask;
  }
```

When running the performance test we see a substantial improvement when unrolling the loops:

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.13s | 1x      |
| F# (reference)    | 28s   | -25x    |
| C++ (reference)   | 22s   | -20x    |
| C++ (AVX)         | 790ms | 1.4x    |
| C++ (unroll)      | 520ms | 2.2x    |

However, it's still not 4x faster. Let's check the assembly code:

```asm
// MANDEL_INNER()
//   Repeated 8 times
00007FF7A3CF1050  vmulps      ymm1,ymm3,ymm7
00007FF7A3CF1054  vaddps      ymm0,ymm1,ymm1
00007FF7A3CF1058  vmulps      ymm4,ymm3,ymm3
00007FF7A3CF105C  vaddps      ymm3,ymm0,ymm9
00007FF7A3CF1061  vmulps      ymm1,ymm7,ymm7
00007FF7A3CF1065  vsubps      ymm0,ymm1,ymm4
00007FF7A3CF1069  vaddps      ymm2,ymm0,ymm8
// ...
// MANDEL_CHECK ();
00007FF7A3CF113F  vcmplt_oqps ymm1,ymm2,ymm12
00007FF7A3CF1145  vmovmskps   eax,ymm1
00007FF7A3CF1149  vaddps      ymm3,ymm0,ymm9
// if (!cmp_mask)
00007FF7A3CF114E  test        eax,eax
00007FF7A3CF1150  je          `anonymous namespace'::mandelbrot_avx_slow+192h (07FF7A3CF1192h)
// for (auto outer = 6; outer > 0; --outer)
00007FF7A3CF1152  dec         ecx
00007FF7A3CF1154  test        ecx,ecx
00007FF7A3CF1156  jg          `anonymous namespace'::mandelbrot_avx_slow+50h (07FF7A3CF1050h)
// MANDEL_INNER()
//   Repeated 2 times
00007FF7A3CF115C  vmulps      ymm1,ymm3,ymm7
00007FF7A3CF1160  vaddps      ymm0,ymm1,ymm1
00007FF7A3CF1164  vmulps      ymm1,ymm7,ymm7
00007FF7A3CF1168  vmulps      ymm5,ymm3,ymm3
00007FF7A3CF116C  vaddps      ymm3,ymm0,ymm9
00007FF7A3CF1171  vsubps      ymm0,ymm1,ymm5
00007FF7A3CF1175  vaddps      ymm2,ymm0,ymm8
// ...
// MANDEL_CHECK ();
00007FF7A3CF1186  vcmplt_oqps ymm2,ymm1,ymm12
00007FF7A3CF118C  vmovmskps   eax,ymm2
```

This looks good, but why aren't we seeing 4x time speedup?

# Understanding latency & throughput of assembly instructions

When checking the timings for the assembly instructions (opcodes) we can see that there are two numbers listed for each (From [Intel Intrinsics Guide](https://software.intel.com/sites/landingpage/IntrinsicsGuide/)):

| opcode            | Latency  | Throughput |
| ----------------- | -------- | ---------- |
| vmulps            | 5        | 1          |
| vaddps            | 3        | 1          |
| vsubps            | 3        | 1          |
| vcmpps            | 3        | 1          |
| vmovmskps         | 1        | 1          |

I have an Intel Core-I5 3570K which happens is the Ivy Bridge architecture. The numbers are taken for that architecture.

Latency is how many clock cycles it takes for a result to be ready to be used. Throughput is how many clock cycles the CPU needs to compute result. Throughput on more modern Intel architectures is 0.5 for many of the instructions above meaning the CPU can do run two instructions in parallel.

The issue with the code above is that because the calculations are dependent on the previous result the CPU needs to stall because of the latency. If we ran more independent calculations in parallel we should be better able to use the throughput of the CPU by avoiding stalls.

This technique is also used by `mandelbrot_6` for the same reasons.

There are 16 AVX registers on my machine and each group of 8 pixels needs 2 registers to carry over in each iteration. So if we compute 4 groups of 8 pixels in we use 8 registers and have 8 more for other computations meaning we probably don't need to push results on the stack.

This means that each iteration will compute 32 pixels.

# Processing 32 pixels per iteration

The code:

```c++
#define MANDEL_INDEPENDENT(i)                                         \
        xy[i] = _mm256_mul_ps (x[i], y[i]);                           \
        x2[i] = _mm256_mul_ps (x[i], x[i]);                           \
        y2[i] = _mm256_mul_ps (y[i], y[i]);
#define MANDEL_DEPENDENT(i)                                           \
        y[i]  = _mm256_add_ps (_mm256_add_ps (xy[i], xy[i]) , cy[i]); \
        x[i]  = _mm256_add_ps (_mm256_sub_ps (x2[i], y2[i]) , cx[i]);

#define MANDEL_ITERATION()  \
  MANDEL_INDEPENDENT(0)     \
  MANDEL_DEPENDENT(0)       \
  MANDEL_INDEPENDENT(1)     \
  MANDEL_DEPENDENT(1)       \
  MANDEL_INDEPENDENT(2)     \
  MANDEL_DEPENDENT(2)       \
  MANDEL_INDEPENDENT(3)     \
  MANDEL_DEPENDENT(3)

#define MANDEL_CMPMASK()  \
        cmp_mask      =   \
            (_mm256_movemask_ps (_mm256_cmp_ps (_mm256_add_ps (x2[0], y2[0]), _mm256_set1_ps (4.0F), _CMP_LT_OQ))      ) \
          | (_mm256_movemask_ps (_mm256_cmp_ps (_mm256_add_ps (x2[1], y2[1]), _mm256_set1_ps (4.0F), _CMP_LT_OQ)) << 8 ) \
          | (_mm256_movemask_ps (_mm256_cmp_ps (_mm256_add_ps (x2[2], y2[2]), _mm256_set1_ps (4.0F), _CMP_LT_OQ)) << 16) \
          | (_mm256_movemask_ps (_mm256_cmp_ps (_mm256_add_ps (x2[3], y2[3]), _mm256_set1_ps (4.0F), _CMP_LT_OQ)) << 24)

  MANDEL_INLINE int mandelbrot_avx (__m256 cx[4], __m256 cy[4])
  {

    __m256  x[4] {cx[0], cx[1], cx[2], cx[3]};
    __m256  y[4] {cy[0], cy[1], cy[2], cy[3]};
    __m256 x2[4];
    __m256 y2[4];
    __m256 xy[4];

    std::uint32_t cmp_mask;

    // 6 * 8 + 2 => 50 iterations
    auto iter = 6;
    do
    {
      // 8 inner steps
      MANDEL_ITERATION();
      MANDEL_ITERATION();
      MANDEL_ITERATION();
      MANDEL_ITERATION();
      MANDEL_ITERATION();
      MANDEL_ITERATION();
      MANDEL_ITERATION();
      MANDEL_ITERATION();

      MANDEL_CMPMASK();

      if (!cmp_mask)
      {
        return 0;
      }

      --iter;

    } while (iter && cmp_mask);

    // Last 2 steps
    MANDEL_ITERATION();
    MANDEL_ITERATION();

    MANDEL_CMPMASK();

    return cmp_mask;
  }
```

The code has grown a lot more complex because instead of processing a single pixel in each iteration we are now processing 32 pixels.

What are the results?

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.13s | 1x      |
| F# (reference)    | 28s   | -24x    |
| C++ (reference)   | 22s   | -20x    |
| C++ (AVX)         | 790ms | 1.4x    |
| C++ (unroll)      | 520ms | 2.2x    |
| C++ (32 pixels)   | 290ms | 3.9x    |

We finally landed where we wanted, by using floats and AVX we sped up `mandelbrot_6` 4 times.

## Applying our learnings to F#

.NET and therefore F# doesn't support AVX but .NET support SSE. How fast can we make an F# program if we apply all our new knowledge to it.

Here is the updated F# mandelbrot infinity test.

```fsharp
  // The mandelbrot equation: Z' = Z^2 + C
let mandelbrot (cx_1 : Vector<float32>) (cy_1 : Vector<float32>) (cx_2 : Vector<float32>) (cy_2 : Vector<float32>) : byte =
  let inline ( * ) x y = (x : Vector<float32>)*y
  let inline ( + ) x y = (x : Vector<float32>)+y

  let rec loop rem x_1 y_1 x_2 y_2 cx_1 cy_1 cx_2 cy_2 =
    let zero          = Vector<float32>.Zero

    let mutable x_1   = x_1
    let mutable y_1   = y_1
    let mutable x_2   = x_2
    let mutable y_2   = y_2

    let mutable xy_1  = zero
    let mutable x2_1  = zero
    let mutable y2_1  = zero
    let mutable xy_2  = zero
    let mutable x2_2  = zero
    let mutable y2_2  = zero

    if rem > 0 then
      System.Diagnostics.Debugger.Break ()
      // #0
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #1
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #2
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #3
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #4
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #5
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #6
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #7
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      let r2_1 = x2_1 + y2_1
      let r2_2 = x2_2 + y2_2

      if
            r2_1.[0] < 4.F
        ||  r2_1.[1] < 4.F
        ||  r2_1.[2] < 4.F
        ||  r2_1.[3] < 4.F
        ||  r2_2.[0] < 4.F
        ||  r2_2.[1] < 4.F
        ||  r2_2.[2] < 4.F
        ||  r2_2.[3] < 4.F
        then
          loop (rem - 1) x_1 y_1 x_2 y_2 cx_1 cy_1 cx_2 cy_2
        else
          0uy
    else
      // #48
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      // #49
      xy_1     <- x_1 * y_1
      x2_1     <- x_1 * x_1
      y2_1     <- y_1 * y_1
      y_1      <- xy_1 + xy_1 + cy_1
      x_1      <- x2_1 - y2_1 + cx_1

      xy_2     <- x_2 * y_2
      x2_2     <- x_2 * x_2
      y2_2     <- y_2 * y_2
      y_2      <- xy_2 + xy_2 + cy_2
      x_2      <- x2_2 - y2_2 + cx_2

      let r2_1 = x2_1 + y2_1
      let r2_2 = x2_2 + y2_2

      let inline bit (r : Vector<float32>) i b =
        if    r.[i] < 4.F then b
        else  0uy

      let r =
            bit r2_1 0 0x80uy
        ||| bit r2_1 1 0x40uy
        ||| bit r2_1 2 0x20uy
        ||| bit r2_1 3 0x10uy
        ||| bit r2_2 0 0x08uy
        ||| bit r2_2 1 0x04uy
        ||| bit r2_2 2 0x02uy
        ||| bit r2_2 3 0x01uy

      r

  loop 6 cx_1 cy_1 cx_2 cy_2 cx_1 cy_1 cx_2 cy_2
```

It's very far from being idiomatic F# but is it fast?

| Algorithm         | Time  | Speedup |
| ----------------- | ----- | ------- |
| mandelbrot_6      | 1.13s | 1x      |
| F# (reference)    | 28s   | -24x    |
| C++ (reference)   | 22s   | -20x    |
| C++ (AVX)         | 790ms | 1.4x    |
| C++ (unroll)      | 520ms | 2.2x    |
| C++ (32 pixels)   | 290ms | 3.9x    |
| F# (SSE)          | 890ms | 1.3x    |

The updated F# code is actually 30% faster than `mandelbrot_6` but before we break out the champagne this program uses single precision floats in order to process 4 pixels per instruction where `mandelbrot_6` uses double precision. Still not too shabby and about 30x faster than the reference F# mandelbrot generator.

Let's dig into the assembly code again:

```asm
; if rem > 0 then
00007FFE7F953A72  test        eax,eax
00007FFE7F953A74  jle         00007FFE7F953EAE
; 00007FFE7F953A7A  call        00007FFEDE630CC0
; xy_1     <- x_1 * y_1
00007FFE7F953A7F  movaps      xmm0,xmm6
00007FFE7F953A82  mulps       xmm0,xmm7
; x2_1     <- x_1 * x_1
00007FFE7F953A85  movaps      xmm1,xmm6
00007FFE7F953A88  mulps       xmm1,xmm6
; y2_1     <- y_1 * y_1
00007FFE7F953A8B  movaps      xmm2,xmm7
00007FFE7F953A8E  mulps       xmm2,xmm7
; y_1      <- xy_1 + xy_1 + cy_1
00007FFE7F953A91  addps       xmm0,xmm0
; Loads cx from [rdi] (sad, we have 16 SSE registers)
00007FFE7F953A94  movups      xmm3,xmmword ptr [rdi]
00007FFE7F953A97  movaps      xmm7,xmm0
00007FFE7F953A9A  addps       xmm7,xmm3
; x_1      <- x2_1 - y2_1 + cx_1
00007FFE7F953A9D  subps       xmm1,xmm2
; Loads cy from [rsi] (sad, we have 16 SSE registers)
00007FFE7F953AA0  movups      xmm2,xmmword ptr [rsi]
00007FFE7F953AA3  movaps      xmm6,xmm1
00007FFE7F953AA6  addps       xmm6,xmm2
; xy_2     <- x_2 * y_2
00007FFE7F953AA9  movaps      xmm0,xmm8
00007FFE7F953AAD  mulps       xmm0,xmm9
; x2_2     <- x_2 * x_2
00007FFE7F953AB1  movaps      xmm1,xmm8
00007FFE7F953AB5  mulps       xmm1,xmm8
; y2_2     <- y_2 * y_2
00007FFE7F953AB9  movaps      xmm2,xmm9
00007FFE7F953ABD  mulps       xmm2,xmm9
; y_2      <- xy_2 + xy_2 + cy_2
00007FFE7F953AC1  addps       xmm0,xmm0
; Loads cx from [rbp] (sad, we have 16 SSE registers)
00007FFE7F953AC4  movups      xmm3,xmmword ptr [rbp]
00007FFE7F953AC8  movaps      xmm9,xmm0
00007FFE7F953ACC  addps       xmm9,xmm3
00007FFE7F953AD0  subps       xmm1,xmm2
; Loads cy from [rbx] (sad, we have 16 SSE registers)
00007FFE7F953AD3  movups      xmm2,xmmword ptr [rbx]
; ... repeated 8 times
; let r2_1 = x2_1 + y2_1
00007FFE7F953D7D  movaps      xmm0,xmm1
00007FFE7F953D80  addps       xmm0,xmm2
; let r2_2 = x2_2 + y2_2
00007FFE7F953D83  movaps      xmm5,xmm3
00007FFE7F953D86  addps       xmm5,xmm4
; r2_1.[0] < 4.F
00007FFE7F953D89  movaps      xmm1,xmm0
00007FFE7F953D8C  movss       xmm2,dword ptr [7FFE7F954060h]
00007FFE7F953D94  ucomiss     xmm2,xmm1
00007FFE7F953D97  ja          00007FFE7F953E65
; ||  r2_1.[1] < 4.F
00007FFE7F953D9D  movaps      xmm3,xmm0
00007FFE7F953DA0  psrldq      xmm3,4
00007FFE7F953DA5  movss       xmm4,dword ptr [7FFE7F954064h]
00007FFE7F953DAD  ucomiss     xmm4,xmm3
00007FFE7F953DB0  seta        al
00007FFE7F953DB3  movzx       eax,al
00007FFE7F953DB6  test        eax,eax
00007FFE7F953DB8  jne         00007FFE7F953E65
; ... repeated 6 more times.
;  Unfortunately the SSE support in .NET doesn't support parallel comparison
; We are done, all points tend to infinity
00007FFE7F953E85  xor         eax,eax
; ...
00007FFE7F953EAD  ret
; #48
; xy_1     <- x_1 * y_1
00007FFE7F953EAE  movaps      xmm0,xmm6
00007FFE7F953EB1  mulps       xmm0,xmm7
; x2_1     <- x_1 * x_1
00007FFE7F953EB4  movaps      xmm1,xmm6
00007FFE7F953EB7  mulps       xmm1,xmm6
; y2_1     <- y_1 * y_1
00007FFE7F953EBA  movaps      xmm2,xmm7
00007FFE7F953EBD  mulps       xmm2,xmm7
; y_1      <- xy_1 + xy_1 + cy_1
00007FFE7F953EC0  addps       xmm0,xmm0
00007FFE7F953EC3  movups      xmm3,xmmword ptr [rdi]
; x_1      <- x2_1 - y2_1 + cx_1
00007FFE7F953EC6  movaps      xmm7,xmm0
00007FFE7F953EC9  addps       xmm7,xmm3
00007FFE7F953ECC  subps       xmm1,xmm2
00007FFE7F953ECF  movups      xmm2,xmmword ptr [rsi]
00007FFE7F953ED2  movaps      xmm6,xmm1
00007FFE7F953ED5  addps       xmm6,xmm2
; xy_2     <- x_2 * y_2
00007FFE7F953ED8  movaps      xmm0,xmm8
00007FFE7F953EDC  mulps       xmm0,xmm9
; x2_2     <- x_2 * x_2
00007FFE7F953EE0  movaps      xmm3,xmm8
00007FFE7F953EE4  mulps       xmm3,xmm8
; y2_2     <- y_2 * y_2
00007FFE7F953EE8  movaps      xmm4,xmm9
00007FFE7F953EEC  mulps       xmm4,xmm9
; y_2      <- xy_2 + xy_2 + cy_2
00007FFE7F953EF0  addps       xmm0,xmm0
00007FFE7F953EF3  movups      xmm1,xmmword ptr [rbp]
00007FFE7F953EF7  movaps      xmm9,xmm0
00007FFE7F953EFB  addps       xmm9,xmm1
; x_2      <- x2_2 - y2_2 + cx_2
00007FFE7F953EFF  subps       xmm3,xmm4
00007FFE7F953F02  movups      xmm4,xmmword ptr [rbx]
00007FFE7F953F05  movaps      xmm8,xmm3
00007FFE7F953F09  addps       xmm8,xmm4
; ... repeated 1 more time
; let r2_1 = x2_1 + y2_1
00007FFE7F953F36  movaps      xmm0,xmm1
00007FFE7F953F39  addps       xmm0,xmm2
; let r2_2 = x2_2 + y2_2
00007FFE7F953F3C  movaps      xmm5,xmm3
00007FFE7F953F3F  addps       xmm5,xmm4
; bit r2_1 0 0x80uy
00007FFE7F953F42  movaps      xmm1,xmm0
00007FFE7F953F45  movss       xmm2,dword ptr [7FFE7F954080h]
00007FFE7F953F4D  ucomiss     xmm2,xmm1
00007FFE7F953F50  jbe         00007FFE7F953F59
00007FFE7F953F52  mov         eax,80h
00007FFE7F953F57  jmp         00007FFE7F953F5B
00007FFE7F953F59  xor         eax,eax
; ||| bit r2_1 1 0x40uy
00007FFE7F953F5B  movaps      xmm1,xmm0
00007FFE7F953F5E  psrldq      xmm1,4
00007FFE7F953F63  movss       xmm2,dword ptr [7FFE7F954084h]
00007FFE7F953F6B  ucomiss     xmm2,xmm1
00007FFE7F953F6E  jbe         00007FFE7F953F77
00007FFE7F953F70  mov         edx,40h
00007FFE7F953F75  jmp         00007FFE7F953F79
00007FFE7F953F77  xor         edx,edx
00007FFE7F953F79  or          eax,edx
; ... repeated 6 more times.
;  Unfortunately the SSE support in .NET doesn't support parallel comparison
; We are done, not all points points tend to infinity
; ...
00007FFE7F954059  ret
```

We see that unfortunately cx and cy are loaded from memory (cache) even though we have 16 registers available but it's not too damaging.

What's worse is that because .NET doesn't support SSE parallel comparison each float is compared separately. The overhead of this is pushed down in that we only check for the condition every 8th iteration.

I think the comparison overhead can be pushed down further by applying some inline IL (a deprecated but cool F# feature). If I return to this post that I something I like to try.

## Final thoughts

### Parallelism is more than cores

When doing this exercise, I was reminded that parallelism is so much more than just executing on multiple cores. It's also about using the SIMD aka SSE/AVX capability of todays CPUs as well as the ability to execute multiple instructions per clock cycle.

### Modern CPUs are nothing like CPUs of old

More subtle is that my mental model of how CPUs execute code is horribly outdated. I basically still thinks in terms of MC68000 assembly code but today's CPUs reorder the code on the fly (in order to work around latency in instructions and memory). We have three layers of cache because RAM is just awfully slow compared to the CPU making writing concurrent code even harder. In addition, each instruction could be seen as an async Task in that the throughput is high but we have long poor latency.

### Is hoping for better compilers a pipe dream?

Compilers definitely can do better but I guess it's probably quite hard to model CPU instructions to include all properties above and then optimize for performance in a reasonable time. For Java and .NET the jitter has much more limited memory and time budget meaning it's unlikely to perform as good as a modern C/C++ compiler.

It gets even more complicated as one of the optimizations applied by `mandelbrot_6` relies on the mathematical properties of the mandelbrot set (that is we only need to do the infinity check every 8th iteration). For a compiler to apply this optimization it would have to identify the algorithm as a mandelbrot set generator and using the mathematical properties of the mandelbrot set apply this optimization.

### Learn from the others

When trying to write performant code it helps a lot to have other examples to look at. It is very easy to trick yourself into thinking that you probably wrote the fasestt code there is. Other examples can help you show new techniques that you didn't consider. I thought my original AVX was pretty optimal but now I know that unrolling loops and computing several groups of pixels at the same time gives a significant performance boost.

### So much unused power!

It's also interesting to see that performance difference between a reasonable efficiently trivial implementation is 75x slower than the fastest implementation that I could come up with. That's a quite large difference. There's much power in the CPU that often is woefully underused.

All in all, a quite interesting experience for me that I like to share in the hope that someone will come up with an even faster version.

