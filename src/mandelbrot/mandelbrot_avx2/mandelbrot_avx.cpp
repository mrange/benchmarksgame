// g++-7 -g --std=c++14 -pipe -Wall -O3 -ffast-math -fno-finite-math-only -march=native -mavx -fopenmp mandelbrot_avx.cpp

# include "stdafx.h"

#include <cstddef>
#include <cstdio>
#include <chrono>
#include <vector>
#include <tuple>

#include <emmintrin.h>
#include <immintrin.h>

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

#define MANDEL_ITERATION()                                    \
        x21 = _mm256_mul_pd (x1, x1);                         \
        y21 = _mm256_mul_pd (y1, y1);                         \
        xy1 = _mm256_mul_pd (x1, y1);                         \
        y1  = _mm256_add_pd (_mm256_add_pd (xy1, xy1) , cy1); \
        x1  = _mm256_add_pd (_mm256_sub_pd (x21, y21) , cx1); \
        x22 = _mm256_mul_pd (x2, x2);                         \
        y22 = _mm256_mul_pd (y2, y2);                         \
        xy2 = _mm256_mul_pd (x2, y2);                         \
        y2  = _mm256_add_pd (_mm256_add_pd (xy2, xy2) , cy2); \
        x2  = _mm256_add_pd (_mm256_sub_pd (x22, y22) , cx2)

#define MANDEL_CMPMASK()  \
        cmp_mask      =   \
            (_mm256_movemask_pd (_mm256_cmp_pd (_mm256_add_pd (x21, y21), _mm256_set1_pd (4.0F), _CMP_LT_OQ)) << 4) \
          | _mm256_movemask_pd (_mm256_cmp_pd (_mm256_add_pd (x22, y22), _mm256_set1_pd (4.0F), _CMP_LT_OQ))

  __forceinline std::uint8_t mandelbrot_avx (__m256d cx1, __m256d cy1, __m256d cx2, __m256d cy2)
  {
    auto x1       = cx1;
    auto y1       = cy1;
    auto x2       = cx2;
    auto y2       = cy2;
    auto cmp_mask = 0 ;

    __m256d x21, y21, xy1, x22, y22, xy2;

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

    auto width = dim / 8; // modulo 8 checked earlier

    set.resize (width*dim);

    auto sdim = static_cast<int> (dim);

    //#pragma omp parallel for schedule(guided)
    for (auto sy = 0; sy < sdim; ++sy)
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
        auto cy1  = _mm256_set1_pd (scaley*y + min_y);
        auto cx2  = _mm256_add_pd (_mm256_set1_pd (scalex*x + min_x), incx2);
        auto cy2  = _mm256_set1_pd (scaley*y + min_y);
        auto bits = mandelbrot_avx (cx1, cy1, cx2, cy2);
        set[yoffset + w] = bits;
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

