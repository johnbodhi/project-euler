#include <iostream>
#include <cassert>

#include "palindromicSums.h"

using namespace std;

palindromicSums::palindromicSums(long int sup) 
	:supremum(sup)
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

long int palindromicSums::getSup() const
{
	return supremum;
}

long long int palindromicSums::getSum(int sup)
{
	K = sup;

	for (int i = 1; i < K; i++) {

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

			for (int kk = 1; kk < i; kk++) {

				for (long long int s = kk; s <= i; s++) {

					S += s * s;

					if (S == i && jj >= 1) {

						SS += i;

						S = 0; jj = 0;

						break;
					}
					else if (S > i) {

						S = 0; jj = 0;

						break;
					}
					jj++;
				}
				S = 0;
			}
		}
		ii = 0; jj = 0;
	}

	std::cout << "SS = " << SS << std::endl;
}





