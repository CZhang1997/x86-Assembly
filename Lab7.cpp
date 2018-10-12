#include <iostream>

using namespace std;

enum ResultCode		{ShowSquare, ShowMultiply, ShowDivide, ShowRemainder, ShowDivideFailure};
enum SuccessCode	{Failure, Success};

extern "C" SuccessCode Divide (long, long, long &, long &);
extern "C" long Multiply (long, long);
extern "C" void PrintResult (ResultCode, long);
extern "C" long Square (long);

void main ()
	{
	long Num1; 
	long Num2;
	long Result;
	long Remainder;
	do
		{
		cout << "Enter Number to Square" << endl;
		cin >> Num1;
		Result = Square (Num1);
		cout << "Square is: " << Result << endl;
		cout << "Enter two numbers to multiply" << endl;
		cin >> Num1 >> Num2;
		Result = Multiply (Num1, Num2);
		cout << "Result of multiply is: " << Result << endl;
		cout << "Enter mumber to divide into then number to divide by" << endl;
		cin >> Num1 >> Num2;
		if (Divide (Num1, Num2, Result, Remainder) == Success)
				cout << "Result is " << Result << " and remainder is " << Remainder << endl;
			else
				cout << "Attempted division by zero";
		} while (Result > 0);
	}

void PrintResult (ResultCode PrintCode, long Value)
	{
	switch (PrintCode)
		{
		case ShowSquare:
				cout << "Display of square is: " << Value << endl;
				break;
		case ShowMultiply:
				cout << "Display of multiply is: " << Value << endl;
				break;
		case ShowDivide:
				cout << "Display of divide is " << Value << endl;
				break;
		case ShowRemainder:
				cout << "Display of remainder is " << Value << endl;
				break;
		case ShowDivideFailure:
				cout << "Display of Division by zero" << endl;
				break;
		default:
				cout << "Error in assembly routines" << endl;
		}
	}
