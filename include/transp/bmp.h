/*
 * Product: Mortal Kombat 4 SDK
 * Author: fymfifa
 * Description: This file is a part of CPPUAL.
 *
 * Copyright (C) 2016 fymfifa
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MK4SDK_BITMAP_H_
#define MK4SDK_BITMAP_H_
#ifdef __cplusplus

#include <memory>
#include <fstream>
#include <mk4sdk/types.h>

namespace MK4SDK {

/*
 * @comment by Sorcerer
 * BMPs are 24-bit and GFXs are 15-bit.
 * So every byte is divided by 8. RGB=(0,0,8) is used in MK4 to define BLACK.
 */

// ===============================================

class Bitmap : public std::fstream
{
public:
    enum class Type : u16
    {
        BM = 0x4D42, // Windows 3.1x, 95, NT, ... etc.
        BA = 0x4142, // OS/2 struct bitmap array
        CI = 0x4943, // OS/2 struct color icon
        CP = 0x5043, // OS/2 const color pointer
        IC = 0x4349, // OS/2 struct icon
        PT = 0x5450  // OS/2 pointer
    };

    enum class Compression : u32
    {
        BI_RGB = 0,
        BI_RLE8, // RLE 8-bit/pixel Can be used only with 8-bit/pixel bitmaps
        BI_RLE4, // RLE 4-bit/pixel Can be used only with 4-bit/pixel bitmaps
        BI_BITFIELDS, // OS22XBITMAPHEADER  : Huffman 1D
                      // BITMAPV2INFOHEADER : RGB bit field masks,
                      // BITMAPV3INFOHEADER+: RGBA
        BI_JPEG, // OS22XBITMAPHEADER  :  RLE-24
                 // BITMAPV4INFOHEADER+: JPEG image for printing
        BI_PNG,  // BITMAPV4INFOHEADER+:  PNG image for printing
        BI_ALPHABITFIELDS, // RGBA bit field masks
                           // only Windows CE 5.0 with .NET 4.0 or later
        BI_CMYK = 11, // only Windows Metafile CMYK
        BI_CMYKRLE8,  // RLE-8 only Windows Metafile CMYK
        BI_CMYKRLE4   // RLE-4 only Windows Metafile CMYK
    };

    struct RGB
    {
        byte red, green, blue;

        // right to left in binary mode
        constexpr RGB binary () const noexcept
        { return { blue, green, red }; }

        constexpr bool operator == (RGB const& obj) const noexcept
        { return red == obj.red && green == obj.green && blue == obj.blue; }
    };

    struct Header  // -- must be 14 bytes --
    {
        Type type; // magic identifier -> 2 bytes
        u32  filesize PACKED; // file size in bytes -> 4 bytes
        u16  reserved1, reserved2; // 2 * 2 bytes
        u32  offset   PACKED; // offset to pixel data in bytes -> 4 bytes
    };

    struct InfoHeader  // -- must be 40 bytes --
    {
        u32         size; // header size in bytes -> 4 bytes
        int32       width, height; // width / height of image -> 2 * 4 bytes
        u16         planes; // number of colour planes -> 2 bytes
        u16         bits; // bits per pixel -> 2 bytes
        Compression compression; // compression type -> 4 bytes
        u32         imageSize; // image size in bytes -> 4 bytes
        int32       xResolution, yResolution; // pixels per meter -> 2 * 4 bytes
        u32         colors; // number of colors -> 4 bytes
        u32         importantColors; // important colors -> 4 bytes

        constexpr u32 pixel_count () const noexcept
        { return static_cast<u32> (width * height); }

        constexpr std::size_t pixel_data_size () const noexcept
        { return pixel_row_size () * static_cast<std::size_t> (height); }

        constexpr std::size_t pixel_row_size  () const noexcept
        {
            return ((sizeof (RGB) * 8 * static_cast<std::size_t> (width) + 31)
                    / 32) * 4;
        }
    };

    typedef std::size_t            size_type;
    typedef std::size_t const      const_size;
    typedef std::streamsize        streamsize;
    typedef std::unique_ptr<RGB[]> pointer_type;

    Bitmap (const char* path, bool create = false)
    : std::fstream (path, in | out | binary),
      m_infoHeader { },
      m_header     { }
    {
        if (!is_open () && create) open (path, in | out | binary | trunc);
        if ( good    ())  _parse_header ();
    }


    inline Bitmap& operator = (Bitmap& obj)
    {
        if (this != &obj)
        {
            off_type tmp_off = obj.tellg ();

            reset_seek    ( );
            obj.seekg     (0);
            std::fstream::operator << (obj.rdbuf ());
            obj.seekg     (tmp_off);
            _parse_header ( );
        }

        return *this;
    }

    bool valid () const noexcept
    {
        return header ().type == Type::BM            &&
               header ().offset                      >=
               sizeof (Header) + sizeof (InfoHeader) &&
               header ().filesize - header ().offset ==
               info   ().pixel_data_size   ();
    }

    void reset_seek ()
    {
        seekg (0);
        seekp (0);
    }

    Header     const& header () const noexcept { return m_header;     }
    InfoHeader const& info   () const noexcept { return m_infoHeader; }

    size_type replace (RGB const target_color, RGB const new_color);
    Bitmap            () = delete;

private:
    void _parse_header ();

private:
    InfoHeader m_infoHeader;
    Header     m_header;
};

// ===============================================

static_assert (sizeof (Bitmap::RGB       ) ==  3, "RGB is not 24-bit!");
static_assert (sizeof (Bitmap::Header    ) == 14, "Header must be 14 bytes!");
static_assert (sizeof (Bitmap::InfoHeader) == 40, "InfoHeader must be 40 bytes!");

} // namespace MK4SDK

#endif // __cplusplus
#endif // MK4SDK_BITMAP_H_

