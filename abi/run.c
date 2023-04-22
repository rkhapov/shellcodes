#include <stdio.h>

int fib(int a, int b, int n) {
	if (n <= 0) {
		return a;
	}

	return fib(a + b, a, n - 1);
}

int main() {
	printf("%d\n", fib(0, 1, 10));
	return 0;
}
