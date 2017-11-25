#include <stdio.h>

int main(void) {
	printf("%d\n", add(3));
	printf("%d\n", multiply(20));

	printf("DONE!\n");
	return 0;
}

/* Adds the parameter to itself and returns the result */
int add(int a) {
	int result = a + a;
	
	return result;
}

/* Multiplies the parameter by itself and returns the result */
int multiply(int a) {
	int result = a * a;

	return result;
}