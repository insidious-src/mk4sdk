#include <iostream>
#include <fstream>

using namespace std;

int main (int argc, char* argv[])
{
    if (argc == 4)
    {
    }
    else
    {
        cout << "Usage: injection fmapname.json fname.json <input file> [output file]\n";
        return 1;
    }

    ifstream src_file  (argv[1]);
    ifstream json_file (argv[3]);
    ofstream dst_file  (argv[2]);

    if (!json_file.good ())
    {
        cerr << "Cannot read from file " << argv[1] << endl;
        return 2;
    }

    if (!src_file.good ())
    {
        cerr << "Cannot read from file " << argv[2] << endl;
        return 3;
    }

    if (!dst_file.is_open ())
    {
        cerr << "Cannot write to file " << argv[3] << endl;
        return 4;
    }


    return 0;
}
