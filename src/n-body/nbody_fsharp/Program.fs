module NBodySystem =

  //open System.Numerics

  [<Struct>]
  type Vector3 = Vector3 of float*float*float

  let inline v3_new    x y z                                         = Vector3 (x, y, z)
  let inline v3_add    (Vector3 (lx, ly, lz)) (Vector3 (rx, ry, rz)) = v3_new (lx+rx) (ly+ry) (lz+rz)
  let inline v3_dot    (Vector3 (lx, ly, lz)) (Vector3 (rx, ry, rz)) = lx*rx + ly*ry + lz*rz
  let inline v3_l2     v                                             = v3_dot v v
  let inline v3_l1     v                                             = sqrt (v3_l2 v)
  let inline v3_scale  s (Vector3 (x, y, z))                         = v3_new (s*x) (s*y) (s*z)

  let v3_zero                                                       = v3_new 0. 0. 0.

  type Body =
    {
      Mass              : float
      mutable Position  : Vector3
      mutable Velocity  : Vector3
    }

  let pi            = 3.141592653589793
  let referenceMass = 4.*pi*pi
  let daysPerYear   = 365.24

  let bodies = 
    let b nm x y z vx vy vz mass : Body = { Mass = mass * referenceMass; Position = v3_new x y z; Velocity = v3_scale daysPerYear (v3_new vx vy vz) }
    [|
//      Name      x                       y                         z                         vx                        vy                      vz                        mass
      b "Sun"     0.                      0.                        0.                        0.                        0.                      0.                        1.
      b "Jupiter" 4.84143144246472090e+00 -1.16032004402742839e+00  -1.03622044471123109e-01  1.66007664274403694e-03   7.69901118419740425e-03 -6.90460016972063023e-05  9.54791938424326609e-04
      b "Saturn"  8.34336671824457987e+00 4.12479856412430479e+00   -4.03523417114321381e-01  -2.76742510726862411e-03  4.99852801234917238e-03 2.30417297573763929e-05   2.85885980666130812e-04
      b "Uranus"  1.28943695621391310e+01 -1.51111514016986312e+01  -2.23307578892655734e-01  2.96460137564761618e-03   2.37847173959480950e-03 -2.96589568540237556e-05  4.36624404335156298e-05
      b "Neptune" 1.53796971148509165e+01 -2.59193146099879641e+01  1.79258772950371181e-01   2.68067772490389322e-03   1.62824170038242295e-03 -9.51592254519715870e-05  5.15138902046611451e-05 
    |]

  let pairs =
    [|
      for i = 0 to bodies.Length - 2 do
        for j = i + 1 to bodies.Length - 1 do
          yield bodies.[i], bodies.[j]
    |]

  let sun =
    let sun       = bodies.[0]
    let tp        = bodies |> Array.fold (fun p (b : Body) -> v3_add p (v3_scale b.Mass b.Velocity)) v3_zero
    sun.Velocity  <- v3_scale (-1./referenceMass) tp
    sun

  let energy (b : Body) =
    let me = 0.5 * b.Mass * (v3_l2 b.Velocity)
    let se = bodies |> Array.sumBy (fun bb -> 
      let diff = v3_add bb.Position (v3_scale -1. b.Position) 
      let l1   = v3_l1 diff
      bb.Mass*b.Mass / l1
      )
    me - se

  let totalEnergy () = 
    let me = bodies |> Array.sumBy (fun b -> 0.5 * b.Mass * (v3_l2 b.Velocity))
    let se = pairs  |> Array.sumBy (fun (b1, b2) ->
      let diff = v3_add b1.Position (v3_scale -1. b2.Position) 
      let l1   = v3_l1 diff
      b1.Mass*b2.Mass / l1
      )
    me + se

[<EntryPoint>]
let main argv = 
  printfn "Energy before: %A" <| NBodySystem.totalEnergy ()
  0
