#include <stdio.h>
#include <math.h>

void wpisz(int n)
{
    int i = 0;
    for (i = 0; i <= n; i++)
        printf("%d\n", i);
}

int funkcja(int n)
{
    return (n / 2) + 2;
}

int wartosc_bezwzgledna(int n)
{
    return abs(n);
}

double logarytmz10(double n)
{
    return log10(n);
}

double potega3stopnia(double n)
{
    return pow(n, 3);
}

double pierwiastek(double n)
{
    return sqrt(n);
}

float testMath(int number, int method)
{

    switch (method)
    {
    case 1:
        return abs(number);
    case 2:
        return log10(number);
    case 3:
        return pow(number, 3);

    case 4:
        return sqrt(number);
    }

    return 0;
}

float min(float m1, float m2, float m3)
{
    return min(m1, m2, m3);
}

void printLine(int width, char c)
{
    for (int i = 0; i < width; i++)
    {
        printf("%c", c);
    }
    printf("\n");
}

void printRectangle(int height, int width, char c)
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            printf("%c", c);
        }
        printf("\n");
    }
}

int isTriangle(int a, int b, int c)
{
    return a + b > c || a + c > b || b + c > a;
}

int silnia(int n)
{
    int suma = 1;
    while (n > 1)
    {
        suma = suma * n;
        n--;
    }
    return suma;
}

int silniaRekursja(int n)
{
    if (n < 0)
        return -1;
    if (n == 0)
    {
        return 1;
    }
    else
        return n * silniaRekursja(n - 1);
}

float Fibonacci(int n)
{
    if (n == 0)
        return 0;

    if (n == 1)
        return 1;

    if (n > 1)
        return Fibonacci(n - 1) + Fibonacci(n - 2);
}

int czy_rok_przystepny(int rok)
{
    return rok % 4 == 0 && rok % 100 != 0 || rok % 400 == 0;
}

int checkIsFirst(int n)
{

    if (n <= 1)
        return 0;

    for (int i = 2; i * i <= (n / 2); i++)
    {
        if (n % i == 0)
        {
            return 0;
        }
    }

    return 1;
}

int randomNumber(int min, int max)
{

    return rand() % max + min;
}

int main()
{

    srand(time(NULL));
    int n;

    printf("Podaj n=");
    scanf("%d", &n);

    printf("Wypisanie: \n");

    wpisz(n);

    printf("Druga funkcja: %d\n", funkcja(n));

    printf("Wartosc bezwzgledna: %d\n", wartosc_bezwzgledna(n));
    printf("Log z 10: %f\n", testMath(10.0, 2));
    printLine(10, 'j');

    printRectangle(10, 5, 'c');

    printf("Czy jest trojkat: %s\n", isTriangle(0, 0, 0) ? "Tak" : "Nie");

    printf("Silnia: %d, %d\n", silnia(3), silniaRekursja(3));

    printf("Fibonacci: %f\n", Fibonacci(12));

    printf("Rok przystepny: %s\n", czy_rok_przystepny(2004) ? "Tak" : "Nie");

    printf("czy jest pierwsza liczba %s \n", checkIsFirst(n) ? "Tak" : "Nie");

    printf("losowa liczba %d\n", randomNumber(19, 200));
    return 0;
}