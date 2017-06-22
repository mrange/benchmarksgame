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
  constexpr auto    min_x    = -1.5F              ;
  constexpr auto    min_y    = -1.0F              ;
  constexpr auto    max_x    =  0.5F              ;
  constexpr auto    max_y    =  1.0F              ;

  template<typename T>
  auto time_it (T a)
  {
    auto before = std::chrono::high_resolution_clock::now ();
    auto result = a ();
    auto after  = std::chrono::high_resolution_clock::now ();
    auto diff   = std::chrono::duration_cast<std::chrono::milliseconds> (after - before).count ();
    return std::make_tuple (diff, std::move (result));
  }

#define MANDEL_ITERATION()                                \
        xy  = _mm256_mul_ps (x, y);                       \
        x2  = _mm256_mul_ps (x, x);                       \
        y2  = _mm256_mul_ps (y, y);                       \
        y   = _mm256_add_ps (_mm256_add_ps (xy, xy) , cy);\
        x   = _mm256_add_ps (_mm256_sub_ps (x2, y2) , cx)
#define MANDEL_CMPMASK() \
        cmp_mask      = _mm256_movemask_ps (_mm256_cmp_ps (_mm256_add_ps (x2, y2), _mm256_set1_ps (4.0F), _CMP_LT_OQ))

  __forceinline std::uint8_t mandelbrot_avx (__m256 cx, __m256 cy)
  {
    auto x        = cx;
    auto y        = cy;
    auto cmp_mask = 0 ;

    __m256 x2, y2, xy;

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
    for (auto sy = 0; sy < sdim; ++sy)
    {
      auto y      = static_cast<std::size_t> (sy);
      auto scalex = (max_x - min_x) / dim;
      auto scaley = (max_y - min_y) / dim;

      auto incx   = _mm256_set_ps (
          0*scalex
        , 1*scalex
        , 2*scalex
        , 3*scalex
        , 4*scalex
        , 5*scalex
        , 6*scalex
        , 7*scalex
        );

      auto yoffset = width*y;
      for (auto w = 0U; w < width; ++w)
      {
        auto x    = w*8;
        auto cx   = _mm256_add_ps (_mm256_set1_ps (scalex*x + min_x), incx);
        auto cy   = _mm256_set1_ps (scaley*y + min_y);
        auto bits = mandelbrot_avx (cx, cy);
        pset[yoffset + w] = bits;
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

  auto file = std::fopen ("mandelbrot_avx.pbm", "wb");

  std::fprintf (file, "P4\n%d %d\n", dim, dim);
  std::fwrite (&set.front (), 1, set.size (), file);

  std::fclose (file);

  return 0;
}

