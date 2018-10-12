#include <iostream>

using namespace std;

extern "C" double Average (int, double []);

void main ()
	{
	double Array1 [10] = {1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 10.0};
	double Array2 [11] = {-1.1, -2.2, -3.3, -4.4, -5.5, -6.6, -7.7, -8.8, -9.9, -10.0, -11.0};

	double sum = 0;
	for (int a = 0; a < 10; a++)
	{
		sum += Array1[a];
	}
	sum /= 10.0;
	cout << "Average of Array1 is " << sum << endl;
	sum = 0;
	for (int a = 0; a < 11; a++)
	{
		sum += Array2[a];
	}
	sum /= 11.0;
	cout << "Average of Array2 is " << sum << endl;

	cout << "Average of Array1 is " << Average(10, Array1) << endl;
	cout << "Average of Array2 is " << Average (11, Array2) << endl;
	

	system("pause");
	}
