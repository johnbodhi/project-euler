#include <iostream>
#include "palindromicSums.h"

auto start = high_resolution_clock::now();

int main() {

	palindromicSums sum1;
	
	sum1.getSup();
	sum1.getSum(1e3);

	auto stop = high_resolution_clock::now();
	auto duration = duration_cast<microseconds>(stop - start);

	std::cout << "Time taken by function: " << duration.count() \
		<< " microseconds." << std::endl;

	return 0;
}