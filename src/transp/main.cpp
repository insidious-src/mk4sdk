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

#include <iostream>
#include <transp/bmp.h>

using namespace std;

int main (int argc, char* argv[])
{
    if (argc < 3)
    {
        cout << "Usage: transp infile.bmp outfile.bmp\n";
        return 1;
    }

    MK4SDK::Bitmap src_file (argv[1]);

    if (!src_file.good ())
    {
        cerr << "cannot read from file " << argv[1] << endl;
        return 2;
    }

    if (!src_file.valid () || src_file.info ().bits != 24)
    {
        cerr << "Invalid file format. Must be 24-bit BMP.\n";
        return 3;
    }

    MK4SDK::Bitmap dst_file (argv[2], true);

    if (!dst_file.good ())
    {
        cerr << "cannot write to file " << argv[2] << endl;
        return 4;
    }

    dst_file = src_file; // copy file
    src_file.close ();

    // replace absolute black with mk4 black:  R  G  B  to  R  G  B
    if (auto num_changes = dst_file.replace ({ 0, 0, 0 }, { 0, 0, 8 }))
    {
        cout << "The transparency problem of " << argv[1]
             << " eliminated successfully\n"   << num_changes
             << " pixels changed\n";
    }
    else
    {
        dst_file.close ();
        remove (argv[2]);
        cout << "The file doesn't have any transparency problems\n";
    }

    return 0;
}
