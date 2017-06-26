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

open System.Numerics
open System.Threading.Tasks

type Mandelbrot =
  class
    
    static member inline step (x : byref<_>, y : byref<_>, cx, cy) =
      let inline ( * ) x y = (x : Vector<float32>)*y
      let inline ( + ) x y = (x : Vector<float32>)+y

      let xy = x * y
      let x2 = x * x
      let y2 = y * y
      y   <- xy + xy + cy
      x   <- x2 - y2 + cx

    // The mandelbrot equation: Z' = Z^2 + C
    static member mandelbrot (cx_1 : Vector<float32>) (cy_1 : Vector<float32>) (cx_2 : Vector<float32>) (cy_2 : Vector<float32>) : byte =
      let rec loop rem x_1 y_1 x_2 y_2 cx_1 cy_1 cx_2 cy_2 =

        let mutable x_1   = x_1
        let mutable y_1   = y_1
        let mutable x_2   = x_2
        let mutable y_2   = y_2

        if rem > 0 then
          // #0
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #1
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #2
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #3
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #4
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #5
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #6
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #7
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          let x2_1 = x_1*x_1
          let y2_1 = y_1*y_1

          let x2_2 = x_2*x_2
          let y2_2 = y_2*y_2

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
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          // #49
          Mandelbrot.step (&x_1, &y_1, cx_1, cy_1)
          Mandelbrot.step (&x_2, &y_2, cx_2, cy_2)

          let x2_1 = x_1*x_1
          let y2_1 = y_1*y_1

          let x2_2 = x_2*x_2
          let y2_2 = y_2*y_2

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
  end

[<EntryPoint>]
let main argv =
  // Argument is the desired x/y size of the set
  let dim     =
    let dim = if argv.Length > 0 then int argv.[0] else 200
    max dim 200
  let dimf    = float32 dim
  let width   = (dim + 7) / 8

  // What part of the mandelbrot set is rendered
  let minX    = -1.5F
  let minY    = -1.0F
  let maxX    =  0.5F
  let maxY    =  1.0F
  // More iterations means a more accurate visualization of the mandelbrot set
  let maxIter =  50

  let scalex  = (maxX - minX) / dimf;
  let scaley  = (maxY - minY) / dimf;

  let pixels  = Array.zeroCreate (width*dim)

  let incx_1  =
    [|
      0.F * scalex
      1.F * scalex
      2.F * scalex
      3.F * scalex
    |] |> Vector<float32>
  let incx_2  =
    [|
      4.F * scalex
      5.F * scalex
      6.F * scalex
      7.F * scalex
    |] |> Vector<float32>

  let mandelbrotSet () =
    Parallel.For (0, dim, fun y ->
      let yoffset = y*width
      for w = 0 to (width - 1) do
        let x     = w*8
        let cx    = scalex*(float32 x) + minX
        let cy    = scaley*(float32 y) + minY
        let cx_1  = Vector<float32> cx + incx_1
        let cx_2  = Vector<float32> cx + incx_2
        let cy_1  = Vector<float32> cy
        let cy_2  = Vector<float32> cy
        let bits  = Mandelbrot.mandelbrot cx_1 cy_1 cx_2 cy_2
        pixels.[yoffset + w] <- bits
      )

  printfn "Generating mandelbrot set: %dx%d(%d)" dim dim maxIter
  let ms, cc0, cc1, cc2, _ = timeIt mandelbrotSet
  printfn "  ... generating mandelbrot set: %d ms, (%d, %d, %d) GC" ms cc0 cc1 cc2

  // Writes the pixels as PBM
  //  Can be viewed using: http://paulcuth.me.uk/netpbm-viewer/
  do
    use fs = System.IO.File.Create "mandelbrot_fsharp2.pbm"
    use ss = new System.IO.StreamWriter (fs)
    ss.Write (sprintf "P4\n%d %d\n" dim dim)
    ss.Flush ()
    fs.Write (pixels, 0, pixels.Length)

  0
