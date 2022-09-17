#include <iostream>
#include <vector>
#include <chrono>

using namespace std::chrono;

using namespace std;

auto start = high_resolution_clock::now();

int main() {

	const int K = 1e3, W = 10;

	int D[W], E[W];

	int M = 0, R = 0, ii = 0, jj = 0;
	
	long long int S = 0, SS = 0;

	for (long long int i = 1; i < K; i++) {

		M = floor( log10( i ) + 1 );

		R = i;

		for (int j = 1; j <= M; j++) {

			D[j - 1] = R - (R / 10) * 10;

			E[M - j] = D[j - 1];

			R = R / 10;
		}

		for (int k = 1; k <= M; k++) {

			if (D[k - 1] == E[k - 1]) {

				ii++;
			}
		}

		if (ii == M) {

			for (int kk = 1; kk < floor(sqrt(i)); kk++) {

				for (long long int s = kk; s <= floor(sqrt(i)); s++) {

					S += s * s; 

					if (S == i && jj >= 1) {

						SS += i;
						
						S = 0; jj = 0;

						break;
					}					
					else if ( S > i ) {

						S = 0; jj = 0;

						break;
					}
					jj++;
				} 
			}
		}
		ii = 0; jj = 0;
	}

	std::cout << "SS = " << SS << std::endl;

	auto stop = high_resolution_clock::now();
	auto duration = duration_cast<microseconds>(stop - start);

	std::cout << "Time taken by function: " << duration.count() \
		<< " microseconds." << std::endl;
	
	return 0;
}