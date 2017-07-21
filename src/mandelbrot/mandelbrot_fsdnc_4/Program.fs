// ----------------------------------------------------------------------------------------------
// Copyright 2017 Mårten Rånge
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------------------

open System.Numerics
open System.Threading.Tasks

// An CPU accelerated floating point vector
type FloatN = Vector<float>

let floatN_2 v0 v1 =
  // Vector<float>.Count is 2 on SSE CPUs, 4 on AVX2 CPUs and potentially
  //  8 on AVX512 CPUs in the future
  //  The benchmarks are running on a machine that only supports SSE so we only
  //  make use of SSE, however by allocating the array of .Count the code works
  //  on newer CPUs
  let vs = Array.zeroCreate FloatN.Count
  vs.[0] <- v0
  vs.[1] <- v1
  FloatN vs

let inline floatN_1 (v : float) = FloatN v

// The mandelbrot equation: Z' = Z^2 + C
type Mandelbrot =
  class

    // By tagging this function as inline the F# compiler eliminates the tuple
    //  creation upon inlining the function
    static member inline step x y cx cy =
      // step is a mandelbrot step
      let inline ( * ) x y = (x : FloatN)*y
      let inline ( + ) x y = (x : FloatN)+y

      let xy = x * y
      let x2 = x * x
      let y2 = y * y
      let yy = xy + xy + cy
      let xx = x2 - y2 + cx

      xx, yy

    // By tagging this function as inline the F# compiler eliminates the tuple
    //  creation upon inlining the function
    static member inline step2 x y cx cy =
      // step2 is a mandelbrot step but we return x2, y2 as well in order to
      //  avoid work when doing the infinity check
      let inline ( * ) x y = (x : FloatN)*y
      let inline ( + ) x y = (x : FloatN)+y

      let xy = x * y
      let x2 = x * x
      let y2 = y * y
      let yy = xy + xy + cy
      let xx = x2 - y2 + cx

      xx, yy, x2, y2

    // We run 4 groups of 2 pixels in each iteration ==> 8 pixels ==> 1 uint8
    //  Each group is an accelerated floating point vector of 2 floats
    //  We run multiple groups in order to minimize CPUs stalls on CPUs that
    //  doesn't have hyper-threading.
    //  If we only ran a single group the CPU would need to stall while waiting
    //  for the result of the previous computation
    //  When having multiple independent groups calculated at the same time
    //  the CPU can reorder the execution in order to avoid stalls
    //  (out-of-order execution)
    static member mandelbrot cx_0 cy_0 cx_1 cy_1 cx_2 cy_2 cx_3 cy_3 : uint8 =
      // This implementation is heavily inspired by mandelbrot_6:
      //  http://benchmarksgame.alioth.debian.org/u64q/program.php?test=regexredux&lang=gcc&id=4

      // The total number of iterations is 50 but we unroll 8 times meaning the loop iterate
      //  6 times, then computes two mandelbrot step and it produces the final bitmask

      let rec loop rem x_0 y_0 cx_0 cy_0 x_1 y_1 cx_1 cy_1 x_2 y_2 cx_2 cy_2 x_3 y_3 cx_3 cy_3 =

        if rem > 0 then

          // Instead of checking the infinity check on each iteration we unroll 8 times
          //  and just check every 8th time
          //  This optimization is safe to do as once a mandelbrot vector grows longer than 2
          //  it will never become less than 2 again and tend toward infinity

          // #0
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #1
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #2
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #3
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #4
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #5
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #6
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #7
          let x_0, y_0, x2_0, y2_0 = Mandelbrot.step2 x_0 y_0 cx_0 cy_0
          let x_1, y_1, x2_1, y2_1 = Mandelbrot.step2 x_1 y_1 cx_1 cy_1
          let x_2, y_2, x2_2, y2_2 = Mandelbrot.step2 x_2 y_2 cx_2 cy_2
          let x_3, y_3, x2_3, y2_3 = Mandelbrot.step2 x_3 y_3 cx_3 cy_3

          let r2_0 = x2_0 + y2_0
          let r2_1 = x2_1 + y2_1
          let r2_2 = x2_2 + y2_2
          let r2_3 = x2_3 + y2_3

          // Normally the mandelbrot functions stop iterating as soon as the vector
          //  is longer than 2. But as we are running 8 pixels in each iteration
          //  we will iterate as long as one vector length is less or equal to 2

          let inline cmp (r : FloatN) i =
            // It's important to compare less or equal than 4 because some vectors
            //  will reach infinity and then due to x2 - y2 then next length will be NaN
            //  By comparing with <= we make sure that it works when the length is NaN
            r.[i] <= 4.

          // Unfortunately .NET SIMD support doesn't support vector comparison.
          //  Not too bad for SSE + doubles but when running AVX + float32 we really would
          //  like vector comparisons
          let c =
               cmp r2_0 0
            || cmp r2_0 1
            || cmp r2_1 0
            || cmp r2_1 1
            || cmp r2_2 0
            || cmp r2_2 1
            || cmp r2_3 0
            || cmp r2_3 1

          // if c is true then at least 1 vector length is less than 2 and we continue looping

          if c then
              loop (rem - 1) x_0 y_0 cx_0 cy_0 x_1 y_1 cx_1 cy_1 x_2 y_2 cx_2 cy_2 x_3 y_3 cx_3 cy_3
            else
              0uy
        else
          // #48
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #49
          let x_0, y_0, x2_0, y2_0 = Mandelbrot.step2 x_0 y_0 cx_0 cy_0
          let x_1, y_1, x2_1, y2_1 = Mandelbrot.step2 x_1 y_1 cx_1 cy_1
          let x_2, y_2, x2_2, y2_2 = Mandelbrot.step2 x_2 y_2 cx_2 cy_2
          let x_3, y_3, x2_3, y2_3 = Mandelbrot.step2 x_3 y_3 cx_3 cy_3

          let r2_0 = x2_0 + y2_0
          let r2_1 = x2_1 + y2_1
          let r2_2 = x2_2 + y2_2
          let r2_3 = x2_3 + y2_3

          // Generate the final bitmask

          let inline bit (r : FloatN) i s =
            if    r.[i] <= 4. then (1uy <<< s)
            else  0uy

          // Unfortunately .NET SIMD support doesn't support vector comparison.
          //  Not too bad for SSE + doubles but when running AVX + float32 we really would
          //  like vector comparisons
          let r =
                bit r2_0 0 0x7
            ||| bit r2_0 1 0x6
            ||| bit r2_1 0 0x5
            ||| bit r2_1 1 0x4
            ||| bit r2_2 0 0x3
            ||| bit r2_2 1 0x2
            ||| bit r2_3 0 0x1
            ||| bit r2_3 1 0x0

          r

      loop 6 cx_0 cy_0 cx_0 cy_0 cx_1 cy_1 cx_1 cy_1 cx_2 cy_2 cx_2 cy_2 cx_3 cy_3 cx_3 cy_3

    // mandelbrot_full always iterate 50 times
    //  This is used after the previous group of pixels contained at least 1 pixel in the mandelbrot
    //  Because there are large areas of pixels belonging to the mandelbrot set it  give some improvement
    //  when checking these areas
    static member mandelbrot_full cx_0 cy_0 cx_1 cy_1 cx_2 cy_2 cx_3 cy_3 : uint8 =
      let rec loop rem x_0 y_0 cx_0 cy_0 x_1 y_1 cx_1 cy_1 x_2 y_2 cx_2 cy_2 x_3 y_3 cx_3 cy_3 =

        if rem > 0 then
          // #0
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #1
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #2
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #3
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #4
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #5
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #6
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #7
          let x_0, y_0, x2_0, y2_0 = Mandelbrot.step2 x_0 y_0 cx_0 cy_0
          let x_1, y_1, x2_1, y2_1 = Mandelbrot.step2 x_1 y_1 cx_1 cy_1
          let x_2, y_2, x2_2, y2_2 = Mandelbrot.step2 x_2 y_2 cx_2 cy_2
          let x_3, y_3, x2_3, y2_3 = Mandelbrot.step2 x_3 y_3 cx_3 cy_3

          let r2_0 = x2_0 + y2_0
          let r2_1 = x2_1 + y2_1
          let r2_2 = x2_2 + y2_2
          let r2_3 = x2_3 + y2_3

          loop (rem - 1) x_0 y_0 cx_0 cy_0 x_1 y_1 cx_1 cy_1 x_2 y_2 cx_2 cy_2 x_3 y_3 cx_3 cy_3
        else
          // #48
          let x_0, y_0 = Mandelbrot.step x_0 y_0 cx_0 cy_0
          let x_1, y_1 = Mandelbrot.step x_1 y_1 cx_1 cy_1
          let x_2, y_2 = Mandelbrot.step x_2 y_2 cx_2 cy_2
          let x_3, y_3 = Mandelbrot.step x_3 y_3 cx_3 cy_3

          // #49
          let x_0, y_0, x2_0, y2_0 = Mandelbrot.step2 x_0 y_0 cx_0 cy_0
          let x_1, y_1, x2_1, y2_1 = Mandelbrot.step2 x_1 y_1 cx_1 cy_1
          let x_2, y_2, x2_2, y2_2 = Mandelbrot.step2 x_2 y_2 cx_2 cy_2
          let x_3, y_3, x2_3, y2_3 = Mandelbrot.step2 x_3 y_3 cx_3 cy_3

          let r2_0 = x2_0 + y2_0
          let r2_1 = x2_1 + y2_1
          let r2_2 = x2_2 + y2_2
          let r2_3 = x2_3 + y2_3

          let inline bit (r : FloatN) i s =
            if    r.[i] <= 4. then (1uy <<< s)
            else  0uy

          let r =
                bit r2_0 0 0x7
            ||| bit r2_0 1 0x6
            ||| bit r2_1 0 0x5
            ||| bit r2_1 1 0x4
            ||| bit r2_2 0 0x3
            ||| bit r2_2 1 0x2
            ||| bit r2_3 0 0x1
            ||| bit r2_3 1 0x0

          r

      loop 6 cx_0 cy_0 cx_0 cy_0 cx_1 cy_1 cx_1 cy_1 cx_2 cy_2 cx_2 cy_2 cx_3 cy_3 cx_3 cy_3
  end

[<EntryPoint>]
let main argv =
  // Argument is the desired x/y size of the set
  let dim       =
    let dim = if argv.Length > 0 then int argv.[0] else 200
    max dim 200
  let dimf      = float dim
  let width     = (dim + 7) / 8

  // What part of the mandelbrot set is rendered
  let minX      = -1.5
  let minY      = -1.0
  let maxX      =  0.5
  let maxY      =  1.0

  let scaleX    = (maxX - minX) / dimf;
  let scaleY    = (maxY - minY) / dimf;

  let pixels    = Array.zeroCreate (width*dim)

  let minX2     = floatN_1 minX
  let scaleX2   = floatN_1 scaleX

  // Generates the bitmap
  let mandelbrotSet () =
    let shiftX2_0 = floatN_2 0. 1.
    let shiftX2_1 = floatN_2 2. 3.
    let shiftX2_2 = floatN_2 4. 5.
    let shiftX2_3 = floatN_2 6. 7.

    // Use .NET Parallel.For to run the outer loop on all available cores
    Parallel.For (0, dim, fun y ->
      let yoffset = y*width
      let cy_0    = floatN_1 (scaleY*(float (y    )) + minY)
      let mutable last_full = false
      for w = 0 to (width - 1) do
        let x     = w*8
        let x2    = floatN_1 (float x)
        // There are simpler ways to generate the cx_0..cx_3 but they are more
        //  prone to rounding issues
        let cx_0  = minX2 + (x2 + shiftX2_0)*scaleX2
        let cx_1  = minX2 + (x2 + shiftX2_1)*scaleX2
        let cx_2  = minX2 + (x2 + shiftX2_2)*scaleX2
        let cx_3  = minX2 + (x2 + shiftX2_3)*scaleX2
        let bits  =
          if last_full then
            Mandelbrot.mandelbrot_full cx_0 cy_0 cx_1 cy_0 cx_2 cy_0 cx_3 cy_0
          else
            Mandelbrot.mandelbrot cx_0 cy_0 cx_1 cy_0 cx_2 cy_0 cx_3 cy_0
        pixels.[yoffset + w] <- bits

        last_full <- bits <> 0uy
      ) |> ignore

  mandelbrotSet ()

  // Writes the pixels as PBM
  //  Can be viewed using: http://paulcuth.me.uk/netpbm-viewer/
  let fs = System.Console.OpenStandardOutput()
  do
    // Uses let over use because when StreamWriter is disposed it dispises the
    //  the parent stream which is not what we want
    let ss = new System.IO.StreamWriter (fs)
    ss.Write (sprintf "P4\n%d %d\n" dim dim)
    ss.Flush ()
  fs.Write (pixels, 0, pixels.Length)
  fs.Flush ()

  0
