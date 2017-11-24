int main(void) {
	test();
	printf("DONE!\n");
	
	return 0;
}

void test() {
	int a = 0;
	int b = 2;
	int c = 50;
	
	while (b < c) {
		printf("%d\n", a);
		printf("%d\n", b);
		
		a += b;
		b += a;
	} 
	return;
}
