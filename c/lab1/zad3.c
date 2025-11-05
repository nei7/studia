#include <stdio.h>

int main() {
    char tekst[100];
    printf("Podaj tekst ");
  

    // gets(tekst);
    fgets(tekst, sizeof(tekst), stdin);
    
    printf("Wprowadzony tekst: %s", tekst);
    return 0;
}