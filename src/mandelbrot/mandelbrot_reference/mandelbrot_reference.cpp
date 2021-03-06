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

// g++ --std=c++14 -pipe -Wall -O3 -ffast-math -fno-finite-math-only -march=native -mfpmath=sse -msse3 -fopenmp mandelbrot_reference.cpp

#include "stdafx.h"

#include <cassert>
#include <cstddef>
#include <cstdio>
#include <chrono>
#include <memory>
#include <tuple>

namespace
{
  constexpr auto    min_x    = -1.5 ;
  constexpr auto    min_y    = -1.0 ;
  constexpr auto    max_x    =  0.5 ;
  constexpr auto    max_y    =  1.0 ;
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

  auto mandelbrot (double cx, double cy)
  {
    auto x    = cx      ;
    auto y    = cy      ;
    auto iter = max_iter;
    for (; iter > 0; --iter)
    {
      auto x2 = x*x;
      auto y2 = y*y;
      if (x2 + y2 > 4)
      {
        return iter;
      }
      y = 2*x*y   + cy  ;
      x = x2 - y2 + cx  ;
    }

    return iter;
  }

  bitmap::uptr compute_set (std::size_t const dim)
  {
    auto set    = create_bitmap (dim, dim);
    auto width  = set->w;
    auto pset   = set->bits ();

    auto scalex = (max_x - min_x) / dim;
    auto scaley = (max_y - min_y) / dim;

    for (auto y = 0U; y < dim; ++y)
    {
      auto yoffset = y*width;
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

  std::printf ("Generating mandelbrot set %dx%d(%d)\n", dim, dim, max_iter);

  auto res  = time_it ([dim] { return compute_set(dim); });

  auto ms   = std::get<0> (res);
  auto& set = std::get<1> (res);

  std::printf ("  it took %lld ms\n", ms);

  auto file = std::fopen ("mandelbrot_reference.pbm", "wb");

  std::fprintf (file, "P4\n%d %d\n", dim, dim);
  std::fwrite (set->bits (), 1, set-> sz, file);

  std::fclose (file);

  return 0;
}

