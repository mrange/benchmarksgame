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

#include "stdafx.h"

#include <cassert>
#include <cstddef>
#include <cstdio>
#include <chrono>
#include <memory>
#include <tuple>

#include <emmintrin.h>
#include <immintrin.h>

/*
(0, 1)
(3, 4)

(0, 4)
(1, 2)

(0, 3)
(2, 4)

(0, 2)
(1, 3)

(1, 4)

(2, 3)
*/

#define NBODY_INLINE __forceinline

namespace
{
  struct unit_type
  {
  };

  constexpr unit_type unit;

  template<typename T>
  auto time_it (T a)
  {
    auto before = std::chrono::high_resolution_clock::now ();
    auto result = a ();
    auto after  = std::chrono::high_resolution_clock::now ();
    auto diff   = std::chrono::duration_cast<std::chrono::milliseconds> (after - before).count ();
    return std::make_tuple (diff, std::move (result));
  }

  constexpr auto pi             = 3.141592653589793  ;
  constexpr auto reference_mass = 4.*pi*pi           ;
  constexpr auto days_per_year  = 365.24             ;

  NBODY_INLINE auto sqrt (double v)
  {
    auto v2 = _mm_set1_pd (v);
    auto s2 = _mm_sqrt_sd (v2, v2);
    return s2.m128d_f64[0];
  }

  NBODY_INLINE auto v3 (double x, double y, double z) noexcept
  {
    return _mm256_set_pd (x, y, z, 0);
  }

  auto v3_zero = v3 (0, 0, 0);

  NBODY_INLINE auto v3_dot (__m256d l, __m256d r)
  {
    auto lr         = _mm256_mul_pd (l, r);
    auto hadd       = _mm256_hadd_pd (lr, lr);
    auto lo128      = _mm256_extractf128_pd (hadd, 0);
    auto hi128      = _mm256_extractf128_pd (hadd, 1);
    auto dotproduct = _mm_add_pd (lo128, hi128);
    return dotproduct.m128d_f64[0];
  }

  NBODY_INLINE auto v3_l2 (__m256d v)
  {
    return v3_dot (v, v);
  }

  NBODY_INLINE auto v3_l1 (__m256d v)
  {
    return sqrt (v3_l2 (v));
  }

  NBODY_INLINE auto operator* (__m256d v, double s) noexcept
  {
    return _mm256_mul_pd (v, _mm256_set1_pd (s));
  }

  NBODY_INLINE auto operator+ (__m256d l, __m256d r) noexcept
  {
    return _mm256_add_pd (l, r);
  }

  NBODY_INLINE auto operator- (__m256d l, __m256d r)
  {
    return _mm256_sub_pd (l, r);
  }

  struct body
  {
    __m256d position;
    __m256d velocity;
    double  mass    ;
  };

  body new_body (double x, double y, double z, double vx, double vy, double vz, double m)
  {
    return 
    {
        v3 (x, y, z)    
      , v3 (vx, vy, vz) * days_per_year
      , m * reference_mass
    };
  }

  constexpr auto body_count = 5;

  body bodies[body_count] =
  {
      new_body (+0.                     , +0.                       , +0.                       , +0.                       , +0.                     , +0.                     , +1.                     )
    , new_body (+4.84143144246472090e+00, -1.16032004402742839e+00  , -1.03622044471123109e-01  , +1.66007664274403694e-03  , +7.69901118419740425e-03, -6.90460016972063023e-05, +9.54791938424326609e-04)
    , new_body (+8.34336671824457987e+00, +4.12479856412430479e+00  , -4.03523417114321381e-01  , -2.76742510726862411e-03  , +4.99852801234917238e-03, +2.30417297573763929e-05, +2.85885980666130812e-04)
    , new_body (+1.28943695621391310e+01, -1.51111514016986312e+01  , -2.23307578892655734e-01  , +2.96460137564761618e-03  , +2.37847173959480950e-03, -2.96589568540237556e-05, +4.36624404335156298e-05)
    , new_body (+1.53796971148509165e+01, -2.59193146099879641e+01  , +1.79258772950371181e-01  , +2.68067772490389322e-03  , +1.62824170038242295e-03, -9.51592254519715870e-05, +5.15138902046611451e-05)
  };

  auto init = [] 
    {
      auto & sun  = bodies[0];
      auto tp     = v3_zero;
      for (auto & body : bodies)
      {
        tp = tp + body.velocity * body.mass;
      }
      sun.velocity = tp * (-1.0/reference_mass);
      return unit;
    }();

  NBODY_INLINE void update_velocity (double step, int i, int j)
  {
    auto & b1   = bodies[i];
    auto & b2   = bodies[j];
    auto delta  = b1.position - b2.position;
    auto l2     = v3_l2 (delta);
    auto mag    = step / (l2*sqrt (l2)); // TODO: reciprocal sqrt?
    b1.velocity = b1.velocity - delta*(mag*b2.mass);
    b2.velocity = b2.velocity + delta*(mag*b1.mass);
  }

  NBODY_INLINE void update_position (double step, int i)
  {
    auto & b = bodies[i];
    b.position = b.position + b.velocity*step;
  }

/*
(0, 1)
(3, 4)

(0, 4)
(1, 2)

(0, 3)
(2, 4)

(0, 2)
(1, 3)

(1, 4)
(2, 3)
*/

  void advance (double step)
  {
    update_velocity (step, 0, 1);
    update_velocity (step, 3, 4);

    update_velocity (step, 0, 4);
    update_velocity (step, 1, 2);

    update_velocity (step, 0, 3);
    update_velocity (step, 2, 4);

    update_velocity (step, 0, 2);
    update_velocity (step, 1, 3);

    update_velocity (step, 1, 4);
    update_velocity (step, 2, 3);


    update_position (step, 0);
    update_position (step, 1);
    update_position (step, 2);
    update_position (step, 3);
    update_position (step, 4);
  }

  auto advance_n (int n, double step)
  {
    for (auto i = 0; i < n; ++i)
    {
      advance (step);
    }
    return unit;
  }

  auto total_energy ()
  {
    auto me = 0.0;
    for (auto & body : bodies)
    {
      me += 0.5 * body.mass * v3_l2 (body.velocity);
    }

    auto se = 0.0;
    for (auto i = 0; i < body_count; ++i)
    {
      for (auto j = i + 1; j < body_count; ++j)
      {
        auto & b1 = bodies[i];
        auto & b2 = bodies[j];
        auto delta = b1.position - b2.position;
        se += (b1.mass * b2.mass) / v3_l1 (delta);
      }
    }

    return me - se;
  }

}

int main(int argc, char const * argv[])
{
  auto n  = [argc, argv] ()
  {
    auto n = argc > 1 ? atoi (argv[1]) : 0;
    return n > 0 ? n : 1000;
  } ();
  auto step   = 0.01;

  std::printf ("Energy before: %.9f\n", total_energy ());

  auto timed  = time_it ([n, step] { return advance_n (n, step); });
  auto ms     = std::get<0> (timed);

  std::printf ("Energy after : %.9f\n", total_energy ());
  std::printf ("It took %lld ms for n=%d and step=%f\n", ms, n, step);

  return 0;
}

