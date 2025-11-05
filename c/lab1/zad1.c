
#include <stdio.h>


int main()
{
    const float PI = 3.14159265;

    float a,r;

    printf("Podaj bok kwadratu: ");
    scanf("%f", &a);

    printf("Podaj promien: ");
    scanf("%f", &r);

    float pole_kwadratu = a * a;
    float pole_okregu = 2 * PI * r;  
    float pole_kola = PI * r * r;
    

    printf("Pole kwadratu: %.2f\n", pole_kwadratu);
    printf("Pole okregu: %.2f\n", pole_okregu);
    printf("Pole kola: %.2f\n", pole_kola);

    return 0;
}