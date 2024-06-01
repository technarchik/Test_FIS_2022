#include <iostream>
#include <string>

using namespace std;

void credit(long double sum, long double stavka, int months)
{
	int i;
	long double everymonth = 0;
	long double PS = 0;
	long double procents = 0;
	long double dolg_proc = 0;
	long double main_dolg = 0;
	long double ostatok_main_dolg = 0;

	PS = stavka / (100 * months);
	everymonth = sum * (PS / (1 - pow(1 + PS, -months)));

	cout << "Сумма кредита: " << sum << " руб." << endl << "Ставка: " << stavka << "%" << endl << "Срок: " << months << " мес." << endl;
	cout << "Месяц | Ежемесячный платеж | Основной долг | Долг по процентам | Остаток основного долга" << endl;
	for (i = 1; i <= months; i++)
	{
		dolg_proc = sum * PS;
		main_dolg = everymonth - dolg_proc;
		sum = sum - main_dolg;
		if (i == months) { sum = 0;}
		cout << i << "     | " << everymonth << "            | " << main_dolg << "          | " << dolg_proc << "          | " << sum << endl;
	}
}

int main()
{
	setlocale(LC_ALL, "Russian");
	long double sum;
	long double stavka;
	int months;
	char wait;

	cout << "Введите сумму кредита: " << endl;
	cin >> sum;
	cout << endl << "Введите процентную ставку: " << endl;
	cin >> stavka;
	cout << endl << "Введите срок (в месяцах): " << endl;
	cin >> months;

	credit(sum, stavka, months);
	cout << endl << "Ваш кредит рассчитан!" << endl << "Нажмите любую клавишу...";
	cin.get();
	cin.get();
	return 0;
}
