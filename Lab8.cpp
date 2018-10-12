#include <iostream>

using namespace std;

extern "C" long Average (long, long []);

void main ()
	{
	/*long Array1 [10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	long Array2 [11] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
	long Array3 [12] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24};

	cout << "Average of Array1 is " << Average (10, Array1) << endl;
	cout << "Average of Array2 is " << Average (11, Array2) << endl;
	cout << "Average of Array3 is " << Average (12, Array3) << endl;*/

	long Array1[3] = { 2, 2, 3};
	long Array2[4] = { 8, 5, 3, 4};
	long Array3[5] = { 9, 5, 7, 8, 10};

	cout << "Average of Array1 is " << Average(3, Array1) << endl;
	cout << "Average of Array2 is " << Average(4, Array2) << endl;
	cout << "Average of Array3 is " << Average(5, Array3) << endl;
	}
