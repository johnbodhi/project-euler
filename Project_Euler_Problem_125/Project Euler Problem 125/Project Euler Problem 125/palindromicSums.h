#ifndef PALINCDROMICSUMS_H
#define PALINCDROMICSUMS_H

#include <iostream>
#include <vector>
#include <chrono>
#include <cmath>
#include "palindromicSums.h"

using namespace std;

using namespace std::chrono;

class palindromicSums
{
private:

	const long int supremum;

	int M, R, K;

	int D[10], E[10];

	long long int S = 0, SS = 0;

	int ii = 0, jj = 0;

public:

	palindromicSums(long int sup);
	palindromicSums();
	palindromicSums(const palindromicSums& gub);
	~palindromicSums();

	long long int getSum(int sup);

	long int getSup() const;
};
#endif