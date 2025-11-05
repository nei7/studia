#include <stdio.h>

int main() {
    float a, b;
    printf("Podaj liczby: ");
    scanf("%f %f", &a, &b);

    if (b == 0 || a == 0) {
        printf("Wybierz inna liczbe niz 0\n");
    } else {
        printf("Iloraz: %.2f\n", a / b);
    }

    return 0;
}
