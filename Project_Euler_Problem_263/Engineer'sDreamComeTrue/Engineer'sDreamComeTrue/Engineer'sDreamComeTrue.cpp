#include <iostream>
#include <cmath>
#include <algorithm>
#include <random>
#include <chrono>

using namespace std;
using namespace std::chrono;

auto start = high_resolution_clock::now();


int main()
{




  








    std::cout << "\n";
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;
}


