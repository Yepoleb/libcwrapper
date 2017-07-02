#include <stdio.h>

int add(int a, int b)
{
    return a + b;
}

int main()
{
    int a = 3;
    int b = 4;
    printf("add(%d, %d) -> %d\n", a, b, add(a, b));
    return 0;
}
