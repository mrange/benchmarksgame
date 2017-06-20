#include "stdafx.h"

#include <cstddef>
#include <cstdio>
#include <chrono>
#include <vector>
#include <tuple>

namespace
{
  struct unit_t
  {
  };

  constexpr unit_t  unit            ;
  constexpr auto    min_x    = -1.5F;
  constexpr auto    min_y    = -1.0F;
  constexpr auto    max_x    =  0.5F;
  constexpr auto    max_y    =  1.0F;
  constexpr auto    max_iter =  50U ;

  template<typename T>
  auto time_it (T a)
  {
    auto before = std::chrono::high_resolution_clock::now ();
    auto result = a ();
    auto after  = std::chrono::high_resolution_clock::now ();
    auto diff   = std::chrono::duration_cast<std::chrono::milliseconds> (after - before).count ();
    return std::make_tuple (diff, std::move (result));
  }

  auto mandelbrot (float x, float y)
  {
    auto xx   = x       ;
    auto yy   = y       ;
    auto iter = max_iter;
    for (; iter > 0; --iter)
    {
      auto xx2 = xx*xx;
      auto yy2 = yy*yy;
      if (xx2 + yy2 > 4)
      {
        return iter;
      }
      yy  = 2*xx*yy   + y;
      xx  = xx2 - yy2 + x;
    }

    return iter;
  }

  std::vector<std::uint8_t> compute_set (std::size_t const dim)
  {
    std::vector<std::uint8_t> set;

    auto width = (dim - 1) / 8 + 1;

    set.resize (width*dim);

    auto scalex = (max_x - min_x) / dim;
    auto scaley = (max_y - min_y) / dim;

    #pragma omp parallel for schedule(guided)
    for (auto y = 0; y < dim; ++y)
    {
      auto yoffset = width*y;
      for (auto w = 0U; w < width; ++w)
      {
        auto bits = 0U;
        for (auto bit = 0U; bit < 8U; ++bit)
        {
          auto x = w*8 + bit;

          auto i = mandelbrot (scalex*x + min_x, scaley*y + min_y);

          if (i == 0)
          {
            bits |= 1 << (7U - bit);
          }
        }
        set[yoffset + w] = bits;
      }
    }

    return set;
  }

}

int main ()
{
  auto dim  = 200;

  std::printf ("Generating mandelbrot set %dx%d(%d)\n", dim, dim, max_iter);

  auto res  = time_it ([dim] { return compute_set(dim); });

  auto ms   = std::get<0> (res);
  auto& set = std::get<1> (res);

  std::printf ("  it took %lld ms\n", ms);

  auto file = std::fopen ("mandelbrot.pbm", "wb");

  std::fprintf (file, "P4\n%d %d\n", dim, dim);
  std::fwrite (&set.front (), 1, set.size (), file);

  std::fclose (file);

  return 0;
}

