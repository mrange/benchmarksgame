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
  let inline v3_sub    (Vector3 (lx, ly, lz)) (Vector3 (rx, ry, rz)) = v3_new (lx-rx) (ly-ry) (lz-rz)

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

  let ipairs =
    [|
      for i = 0 to bodies.Length - 2 do
        for j = i + 1 to bodies.Length - 1 do
          yield i, j
    |]

  let pairs = ipairs |> Array.map (fun (i, j) -> bodies.[i], bodies.[j])

  do
    let sun       = bodies.[0]
    let tp        = bodies |> Array.fold (fun p (b : Body) -> v3_add p (v3_scale b.Mass b.Velocity)) v3_zero
    sun.Velocity  <- v3_scale (-1./referenceMass) tp

  let advance step =
    for (b1, b2) in pairs do
      let delta = v3_sub b1.Position b2.Position
      let l2    = v3_dot delta delta
      let mag   = step / (l2 * sqrt l2)
      b1.Velocity <- v3_sub b1.Velocity (v3_scale (b2.Mass*mag) delta)
      b2.Velocity <- v3_add b2.Velocity (v3_scale (b1.Mass*mag) delta)
    for b in bodies do
      b.Position <- v3_add b.Position (v3_scale step b.Velocity)

  let totalEnergy () = 
    let me = bodies |> Array.sumBy (fun b -> 0.5 * b.Mass * (v3_l2 b.Velocity))
    let se = pairs  |> Array.sumBy (fun (b1, b2) ->
      let delta = v3_sub b1.Position b2.Position
      let l1    = v3_l1 delta
      b1.Mass*b2.Mass / l1
      )
    me - se

[<EntryPoint>]
let main argv = 
  let n =
    let n = if argv.Length > 0 then int argv.[0] else 1000
    max n 1000
  let step = 0.01

  let compute () =
    printfn "%.9f" <| NBodySystem.totalEnergy ()
    for i = 1 to n do NBodySystem.advance step
    printfn "%.9f" <| NBodySystem.totalEnergy ()

  printfn "Nbody problem (Jovian): n=%d, step=%f" n step
  let ms, cc0, cc1, cc2, _ = timeIt compute
  printfn "  ... %d ms, (%d, %d, %d) GC" ms cc0 cc1 cc2

  0
