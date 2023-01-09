#include <iostream>
#include <random>
#include <iomanip>
#include <vector>
#include <chrono>
#include <fstream>

using namespace std::chrono;

using namespace std;

auto start = high_resolution_clock::now();

int main()
{
	const int N = 100, M = 100;

	int A[N][M];

	int F[N];
	
	std::random_device rd;
	std::mt19937 mt(rd());
	std::uniform_real_distribution <double> dist(1.0, 99.0);







	auto stop = high_resolution_clock::now();
	auto duration = duration_cast<microseconds>(stop - start);

	std::cout << "Time taken by function: " << duration.count() \
		<< " microseconds." << std::endl;
}

