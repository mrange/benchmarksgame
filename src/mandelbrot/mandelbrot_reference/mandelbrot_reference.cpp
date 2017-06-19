#include "stdafx.h"

#include <cstddef>
#include <cstdio>
#include <vector>

namespace
{
  constexpr auto min_x    = -1.5 ;
  constexpr auto min_y    = -1.0 ;
  constexpr auto max_x    =  0.5 ;
  constexpr auto max_y    =  1.0 ;
  constexpr auto max_iter =  49U ;

  auto mandelbrot(double x, double y)
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

  std::vector<std::uint8_t> compute_set(std::size_t const dim)
  {
    std::vector<std::uint8_t> set;

    auto width = (dim - 1) / 8 + 1;

    set.reserve (width*dim);

    auto scalex = (max_x - min_x) / dim;
    auto scaley = (max_y - min_y) / dim;

    for (auto y = 0U; y < dim; ++y)
    {
      for (auto w = 0U; w < width; ++w)
      {
        auto bits = 0U;
        for (auto bit = 0U; bit < 8U; ++bit)
        {
          auto x = w*8 + bit;

          auto i = mandelbrot(scalex*x + min_x, scaley*y + min_y);

          if (i == 0)
          {
            bits |= 1 << (7U - bit);
          }
        }
        set.push_back(bits);
      }
    }

    return set;
  }

}

int main()
{
  auto dim  = 1000;

  auto set  = compute_set(dim);

  auto file = std::fopen ("mandelbrot.pbm", "wb");

  std::fprintf (file, "P4\n%d %d\n", dim, dim);
  std::fwrite (&set.front (), 1, set.size (), file);

  std::fclose (file);

  return 0;
}

