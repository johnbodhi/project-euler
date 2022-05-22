#include <iostream>
#include <chrono>
using namespace std::chrono;
//#include "Sales_item.h";

auto start = high_resolution_clock::now();

int main()
{
	

	int sum3 = 0, sum5 = 0;

	for (int i = 1; i < 1000; ++i) {
		if ( i % 3 == 0) {
			sum3 += i;
		}
		else if (i % 5 == 0){
			sum5 += i;
		}
	}
	std::cout << sum3 + sum5 << std::endl;
	

	

	// Book problems...

	/*int sum = 0, val = 1;

	while (val <= 10) {
		sum += val;
		++val;
	}
	std::cout << "Sum of 1 to 10 inclusive is " << sum << std::endl;
	return 0;*/

	/*int sum = 0, val = 50;

	while (val <= 100) {
		sum += val;
		++val;
	}

	std::cout << "sum of 50 to 100 inclusive is " << sum << std::endl;
	return 0;*/

	//int start = 10;

	//	while (start >= 0) {
	//		std::cout << start << std::endl;
	//		--start;
	//	}

	/*int n1 = 0, n2 = 0;

	std::cout << "Enter two numbers: " << std::endl;
	std::cin >> n1 >> n2;

	if (n1 > n2) {
		while (n1 >= n2) {
			std::cout << n1 << std::endl;
			--n1;
		}
	}

	else if (n2 > n1) {
		while (n2 >= n1) {
			std::cout << n2 << std::endl;
			--n2;
		}
	}*/

	/*int sum = 0;
	for (int i = -100; i <= 100; ++i) {
		sum += i;
	}
	std::cout << sum << std::endl;*/

	/*int sum = 50;
	for (int i = 51; i <= 100; ++i) {
		sum += i;
	}
	std::cout << sum << std::endl;*/


	auto stop = high_resolution_clock::now();
	auto duration = duration_cast<microseconds>(stop - start);
	std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;

}
