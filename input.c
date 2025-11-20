int a;
int b;

int sumar(int x, int y) {
    int r;
    r = x + y;
    return r;
}

int main() {
    int c;
    a = 3;
    b = 4;

    c = sumar(a, b);

    {
        int d;
        d = c + 10;
    }

    e = 5;        // variable no declarada (error)
    c = d + 1;    // d fuera del scope (error)

    return 0;
}
