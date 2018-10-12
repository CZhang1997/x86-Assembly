#include <iostream>

using namespace std;

extern "C" long Divide (long, long, long *);

void main ()
	{
	long	Result;
	long	Remainder;
	long	Dividend;
	long	Divisor;

	do
		{
		cout << "Enter Dividend" << endl; 
		cin >> Dividend;
		cout << "Enter Divisor" << endl;
		cin >> Divisor;

		Result = Divide (Dividend, Divisor, &Remainder);
		cout << "Result is " << Result << " and Remainder is " << Remainder << endl;
		} while ((Result >= 0) || (Remainder != 0));
	Result = Divide (Dividend, Divisor, 0);
	cout << "Result is " << Result << " and Remainder is not used" << endl;
	system("pause");
	}
