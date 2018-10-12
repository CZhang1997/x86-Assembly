#include <iostream>

using namespace std;

extern "C" int Sort (char [] [20], int, int);
extern "C" int StrCmp(char[], char[]);
void main ()
	{
	//cout << StrCmp("taw", "taw") << endl;
	//cout << StrCmp("tewqr", "cfas") << endl;
	//cout << StrCmp("tr32", "bfe") << endl;
	//cout << StrCmp("tt32e", "yasf") << endl;
	//cout << StrCmp("tdsg", "yaef") << endl;
	//cout << StrCmp("tegw", "yegw") << endl;


//	cout << StrCmp("rain", "jack") << endl;
//	cout << StrCmp("hua", "forawfa") << endl;
//	cout << StrCmp("hesa", "ljusse") << endl;
//	cout << StrCmp("gega", "eeqws") << endl;

	//char Strings[3][20]
	//	= { "One",
	//	"Two",
	//	"Three" };

	char Strings [10] [20]
					= {	"One",
						"Two",
						"Three",
						"Four",
						"Five",
						"Six",
						"Seven",
						"Eight",
						"Nine",
						"Ten"	};
	/*char Strings[10][20]
		= { "k",
			"j",
			"i",
			"h",
			"g",
			"f",
			"e",
			"c",
			"b",
			"a" };*/
	int i;
	cout << "Unsorted Strings are" << endl;
	for (i = 0; i < 10; i++)
		cout << '\t' << Strings [i] << endl;
	Sort (Strings, 10, 20);
	cout << "Sorted Strings are" << endl;
	for (i = 0; i < 10; i++)
		cout << '\t' << Strings [i] << endl;


	//cout << "Unsorted Strings are" << endl;
	//for (i = 0; i < 3; i++)
	//	cout << '\t' << Strings[i] << endl;
	//Sort(Strings, 3, 20);
	//cout << "Sorted Strings are" << endl;
	//for (i = 0; i < 3; i++)
	//	cout << '\t' << Strings[i] << endl;

	system("pause");
	}
