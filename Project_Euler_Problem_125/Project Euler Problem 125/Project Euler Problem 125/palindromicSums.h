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

	long int supremum;

public:

	palindromicSums(long int sup);
	palindromicSums();
	palindromicSums(const palindromicSums& gub);
	~palindromicSums();

	long int setSup(long int sup);
	long int getSup() const;

	long long int getSum();

	
};
#endif