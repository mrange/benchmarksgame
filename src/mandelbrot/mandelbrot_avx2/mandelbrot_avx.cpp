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

#include "stdafx.h"

#include <cassert>
#include <cstddef>
#include <cstdio>
#include <chrono>
#include <memory>
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


  struct bitmap
  {
    using uptr = std::unique_ptr<bitmap>;

    std::size_t const x ;
    std::size_t const y ;
    std::size_t const w ;
    std::size_t const sz;

    bitmap (std::size_t x, std::size_t y) noexcept
      : x   (x)
      , y   (y)
      , w   ((x + 7) / 8)
      , sz  (w*y)
    {
      b = static_cast<std::uint8_t*> (malloc(sz));
    }

    ~bitmap () noexcept
    {
      free (b);
      b = nullptr;
    }

    bitmap (bitmap && bm) noexcept
      : x   (bm.x)
      , y   (bm.y)
      , w   (bm.w)
      , b   (bm.b)
      , sz  (bm.sz)
    {
      bm.b = nullptr;
    }

    bitmap (bitmap const &)             = delete;
    bitmap& operator= (bitmap const &)  = delete;
    bitmap& operator= (bitmap &&)       = delete;

    std::uint8_t * bits () noexcept
    {
      assert (b);
      return b;
    }

    std::uint8_t const * bits () const noexcept
    {
      assert (b);
      return b;
    }

  private:
    std::uint8_t * b;
  };

  bitmap::uptr create_bitmap (std::size_t x, std::size_t y)
  {
    return std::make_unique<bitmap> (x, y);
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

#define MANDEL_CMP(i) \
  _mm256_cmp_pd (_mm256_add_pd (x2[i], y2[i]), _mm256_set1_pd (4.0), _CMP_LE_OQ)

#define MANDEL_CMPMASK()                                \
  std::uint32_t cmp_mask =                        \
      (_mm256_movemask_pd (MANDEL_CMP (0)) << 4 ) \
    | (_mm256_movemask_pd (MANDEL_CMP (1))      ) \
    | (_mm256_movemask_pd (MANDEL_CMP (2)) << 12) \
    | (_mm256_movemask_pd (MANDEL_CMP (3)) << 8 )

#define MANDEL_CHECKINF()                         \
  auto cont = _mm256_movemask_pd (_mm256_or_pd (  \
      _mm256_or_pd (MANDEL_CMP(0), MANDEL_CMP(1)) \
    , _mm256_or_pd (MANDEL_CMP(2), MANDEL_CMP(3)) \
    ));                                           \
  if (!cont)                                      \
  {                                               \
    return 0;                                     \
  }

  MANDEL_INLINE std::uint32_t mandelbrot_avx (__m256d cx[4], __m256d cy[4])
  {
    __m256d  x[4] {cx[0], cx[1], cx[2], cx[3]};
    __m256d  y[4] {cy[0], cy[1], cy[2], cy[3]};
    __m256d x2[4];
    __m256d y2[4];
    __m256d xy[4];

    // 6 * 8 + 2 => 50 iterations
    for (auto iter = 6; iter > 0; --iter)
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

      MANDEL_CHECKINF();
    }

    // Last 2 steps
    MANDEL_ITERATION();
    MANDEL_ITERATION();

    MANDEL_CMPMASK();

    return cmp_mask;
  }

  MANDEL_INLINE std::uint32_t mandelbrot_avx_full (__m256d cx[4], __m256d cy[4])
  {
    __m256d  x[4] {cx[0], cx[1], cx[2], cx[3]};
    __m256d  y[4] {cy[0], cy[1], cy[2], cy[3]};
    __m256d x2[4];
    __m256d y2[4];
    __m256d xy[4];

    // 6 * 8 + 2 => 50 iterations
    for (auto iter = 6; iter > 0; --iter)
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
    }

    // Last 2 steps
    MANDEL_ITERATION();
    MANDEL_ITERATION();

    MANDEL_CMPMASK();

    return cmp_mask;
  }

  bitmap::uptr compute_set (std::size_t const dim)
  {
    auto set        = create_bitmap (dim, dim);
    auto width      = set->w;
    auto pset       = set->bits ();

    auto sdim       = static_cast<int> (dim);

    auto scale_x    = (max_x - min_x) / dim;
    auto scale_y    = (max_y - min_y) / dim;

    auto min_x_4    = _mm256_set1_pd (min_x);
    auto scale_x_4  = _mm256_set1_pd (scale_x);
    auto lshift_x_4 = _mm256_set_pd (0, 1, 2, 3);
    auto ushift_x_4 = _mm256_set_pd (4, 5, 6, 7);

    #pragma omp parallel for schedule(guided)
    for (auto sy = 0; sy < sdim; sy += 2)
    {
      auto y                  = static_cast<std::size_t> (sy);

      auto cy0                = _mm256_set1_pd (scale_y*y       + min_y);
      auto cy1                = _mm256_set1_pd (scale_y*(y + 1) + min_y);

      auto yoffset            = width*y;

      auto last_reached_full  = false;

      for (auto w = 0U; w < width; ++w)
      {
        auto x    = w*8;
        auto x_8  = _mm256_set1_pd (x);
        auto cx0  = _mm256_add_pd (min_x_4, _mm256_mul_pd (_mm256_add_pd (x_8, lshift_x_4), scale_x_4));
        auto cx1  = _mm256_add_pd (min_x_4, _mm256_mul_pd (_mm256_add_pd (x_8, ushift_x_4), scale_x_4));
        __m256d cx[4] { cx0, cx1, cx0, cx1 };
        __m256d cy[4] { cy0, cy0, cy1, cy1 };
        auto bits =
          last_reached_full
            ? mandelbrot_avx_full (cx, cy)
            : mandelbrot_avx (cx, cy)
            ;

        pset[yoffset          + w] = 0xFF & (bits     );
        pset[yoffset + width  + w] = 0xFF & (bits >> 8);

        last_reached_full = bits != 0;
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

  auto res  = time_it ([dim] { return compute_set (dim); });

  auto ms   = std::get<0> (res);
  auto& set = std::get<1> (res);

  std::printf ("  it took %lld ms\n", ms);

  auto file = std::fopen ("mandelbrot_avx2.pbm", "wb");

  std::fprintf (file, "P4\n%d %d\n", dim, dim);
  std::fwrite (set->bits (), 1, set->sz, file);

  std::fclose (file);

  return 0;
}

