#include <iostream>
#include <math.h>

#include "palindromicSums.h"

using namespace std;

palindromicSums::palindromicSums(long int sup ) 
	: supremum(sup)
{
}

palindromicSums::palindromicSums()
	:supremum(1e3)
{
}

palindromicSums::palindromicSums(const palindromicSums& gub)
	:supremum(gub.supremum)
{
}

palindromicSums::~palindromicSums()
{
}

long int palindromicSums::setSup(long int sup)
{
	supremum = sup;

	return 0;
}

long int palindromicSums::getSup() const
{
	std::cout << "The current supremum is: " << supremum << std::endl;

	return supremum;
}

long long int palindromicSums::getSum()
{
	long int K = supremum;

	const int U = 9, V = 2;

	int D[U], E[U];

	int M = 0, R = 0, ii = 0, jj = 0, zz = 0;

	long long int A[V], SS = 0;

	for (long long int i = 1; i < K; i++) {

		M = floor(log10(i) + 1);

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

			for (long long int kk = 1; kk < ceil(sqrt(i)); kk++) {

				for (long long int r = kk; r <= ceil(sqrt(i)); r++) {

					A[0] += (r * r);

					if (A[0] == i && jj > 0) {

						if ( A[1] != A[0] ) {

							SS += i; A[1] = A[0];
						}
						else {

							break;
						}

						A[0] = 0; jj = 0;

						zz++;
					}
					else if (A[0] > i) {

						A[0] = 0; jj = 0;

						break;
					}
					jj++;
				}
			}
		}
		ii = 0; jj = 0;
	}

	std::cout << zz << " SS = " << SS << std::endl;

	return 0;
}





