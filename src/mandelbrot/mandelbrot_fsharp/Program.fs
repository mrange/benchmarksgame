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

  // Writes the pixels as PBM
  //  Can be viewed using: http://paulcuth.me.uk/netpbm-viewer/
  do
    use fs = System.IO.File.Create "mandelbrot_fsharp.pbm"
    use ss = new System.IO.StreamWriter (fs)
    ss.Write (sprintf "P4\n%d %d\n" dim dim)
    ss.Flush ()
    fs.Write (pixels, 0, pixels.Length)

  0
