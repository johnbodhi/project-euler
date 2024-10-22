#include <iostream>
#include <cmath>
#include <iomanip>
#include <algorithm>
#include <random>
#include <chrono>

using namespace std;
using namespace std::chrono;

auto start = high_resolution_clock::now();


int main()
{
	const int N = 100, M = N;

	long double A[N][M];

    std::random_device rd;
    std::mt19937 mt(rd());
    std::uniform_real_distribution<double> dist(0.0, 255.0);

   
	for (int i = 1; i <= N; i++) {
		for (int j = 1; j <= M; j++) {

			if (j == 1 || i == j) {

				A[i - 1][j - 1] = 1;
			}
			else {

				A[i - 1][j - 1] = 0;
			}
		}
	}

	for (int i = 2; i <= N; i++) {
		for (int j = 2; j <= M; j++) {
			if (i >= j) {

				A[i - 1][j - 1] = A[i - 2][j - 2] + A[i - 2][j - 1];
			}
			else {

				A[i - 1][j - 1] = 0;
			}
		}
	}

	for (int i = 1; i <= N; i++) {

		if (i == N) {

			std::cout << "n = " << i << " | ";
		}

		for (int j = 1; j <= M; j++) {

			if (i == N) {

				std::cout << A[i - 1][j - 1] << std::endl;;
			}
		}
	}
	std::cout << "\n";

    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;
}


