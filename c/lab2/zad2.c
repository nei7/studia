#include <stdio.h>

int main()
{
    double liczba, suma = 0;
    int licznik = 0;

    printf("Podaj liczby:\n");

    while (1)
    {
        scanf("%lf", &liczba);
        if (liczba == 0)
            break;

        suma += liczba;
        licznik++;
    }

    if (licznik > 0)
    {
        double srednia = suma / licznik;
        printf("Średnia: %lf\n", srednia);
    }
    else
    {
        printf("Nie podano żadnej liczby.\n");
    }

    return 0;
}
