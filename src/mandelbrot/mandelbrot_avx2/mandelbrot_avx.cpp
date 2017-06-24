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

// g++ -g --std=c++14 -pipe -Wall -O3 -ffast-math -fno-finite-math-only -march=native -mavx -fopenmp mandelbrot_avx.cpp

# include "stdafx.h"

#include <cstddef>
#include <cstdio>
#include <chrono>
#include <vector>
#include <tuple>

#include <emmintrin.h>
#include <immintrin.h>

#ifdef _MSVC_LANG
# define MANDEL_INLINE __forceinline
#else
# define MANDEL_INLINE inline
#endif

namespace
{
  constexpr auto    min_x    = -1.5;
  constexpr auto    min_y    = -1.0;
  constexpr auto    max_x    =  0.5;
  constexpr auto    max_y    =  1.0;

  template<typename T>
  auto time_it (T a)
  {
    auto before = std::chrono::high_resolution_clock::now ();
    auto result = a ();
    auto after  = std::chrono::high_resolution_clock::now ();
    auto diff   = std::chrono::duration_cast<std::chrono::milliseconds> (after - before).count ();
    return std::make_tuple (diff, std::move (result));
  }

#define MANDEL_INDEPENDENT(i)                                         \
        xy[i] = _mm256_mul_pd (x[i], y[i]);                           \
        x2[i] = _mm256_mul_pd (x[i], x[i]);                           \
        y2[i] = _mm256_mul_pd (y[i], y[i]);
#define MANDEL_DEPENDENT(i)                                           \
        y[i]  = _mm256_add_pd (_mm256_add_pd (xy[i], xy[i]) , cy[i]); \
        x[i]  = _mm256_add_pd (_mm256_sub_pd (x2[i], y2[i]) , cx[i]);

#define MANDEL_ITERATION()  \
    MANDEL_INDEPENDENT(0)   \
    MANDEL_DEPENDENT(0)     \
    MANDEL_INDEPENDENT(1)   \
    MANDEL_DEPENDENT(1)     \
    MANDEL_INDEPENDENT(2)   \
    MANDEL_DEPENDENT(2)     \
    MANDEL_INDEPENDENT(3)   \
    MANDEL_DEPENDENT(3)

#define MANDEL_CMPMASK()  \
        cmp_mask      =   \
            (_mm256_movemask_pd (_mm256_cmp_pd (_mm256_add_pd (x2[0], y2[0]), _mm256_set1_pd (4.0), _CMP_LT_OQ)) << 4 )  \
          | (_mm256_movemask_pd (_mm256_cmp_pd (_mm256_add_pd (x2[1], y2[1]), _mm256_set1_pd (4.0), _CMP_LT_OQ))      )  \
          | (_mm256_movemask_pd (_mm256_cmp_pd (_mm256_add_pd (x2[2], y2[2]), _mm256_set1_pd (4.0), _CMP_LT_OQ)) << 12)  \
          | (_mm256_movemask_pd (_mm256_cmp_pd (_mm256_add_pd (x2[3], y2[3]), _mm256_set1_pd (4.0), _CMP_LT_OQ)) << 8 )

  MANDEL_INLINE int mandelbrot_avx (__m256d cx[4], __m256d cy[4])
  {
    auto cmp_mask = 0;

    __m256d  x[4] {cx[0], cx[1], cx[2], cx[3]};
    __m256d  y[4] {cy[0], cy[1], cy[2], cy[3]};
    __m256d x2[4];
    __m256d y2[4];
    __m256d xy[4];

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

  std::vector<std::uint8_t> compute_set (std::size_t const dim)
  {
    std::vector<std::uint8_t> set;

    auto width  = dim / 8; // modulo 8 checked earlier

    set.resize (width*dim);

    auto pset   = &set.front ();

    auto sdim   = static_cast<int> (dim);

    #pragma omp parallel for schedule(guided)
    for (auto sy = 0; sy < sdim; sy += 2)
    {
      auto y      = static_cast<std::size_t> (sy);
      auto scalex = (max_x - min_x) / dim;
      auto scaley = (max_y - min_y) / dim;

      auto incx1  = _mm256_set_pd (
          0*scalex
        , 1*scalex
        , 2*scalex
        , 3*scalex
        );

      auto incx2  = _mm256_set_pd (
          4*scalex
        , 5*scalex
        , 6*scalex
        , 7*scalex
        );

      auto yoffset = width*y;
      for (auto w = 0U; w < width; ++w)
      {
        auto x    = w*8;
        auto cx1  = _mm256_add_pd (_mm256_set1_pd (scalex*x + min_x), incx1);
        auto cx2  = _mm256_add_pd (_mm256_set1_pd (scalex*x + min_x), incx2);
        auto cy1  = _mm256_set1_pd (scaley*y + min_y);
        auto cy2  = _mm256_set1_pd (scaley*y + min_y + scaley);
        __m256d cx[4] { cx1, cx2, cx1, cx2 };
        __m256d cy[4] { cy1, cy1, cy2, cy2 };
        auto bits = mandelbrot_avx (cx, cy);
        pset[yoffset          + w] = 0xFF & (bits     );
        pset[yoffset + width  + w] = 0xFF & (bits >> 8);
      }
    }

    return set;
  }

}

int main (int argc, char const * argv[])
{
  auto dim  = [argc, argv] ()
  {
    auto dim = argc > 1 ? atoi (argv[1]) : 0;
    return dim > 0 ? dim : 200;
  } ();

  if (dim % 8 != 0)
  {
    std::printf ("Dimension must be modulo 8\n");
    return 999;
  }

  std::printf ("Generating mandelbrot set %dx%d(50)\n", dim, dim);

  auto res  = time_it ([dim] { return compute_set(dim); });

  auto ms   = std::get<0> (res);
  auto& set = std::get<1> (res);

  std::printf ("  it took %lld ms\n", ms);

  auto file = std::fopen ("mandelbrot_avx2.pbm", "wb");

  std::fprintf (file, "P4\n%d %d\n", dim, dim);
  std::fwrite (&set.front (), 1, set.size (), file);

  std::fclose (file);

  return 0;
}

