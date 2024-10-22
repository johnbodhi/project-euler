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




    std::random_device rd;
    std::mt19937 mt(rd());
    std::uniform_real_distribution<double> dist(0.0, 255.0);









    std::cout << "\n";
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;
}


