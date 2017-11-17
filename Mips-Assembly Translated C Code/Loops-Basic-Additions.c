int x, y, sum= 0;

int main(void) {
	scanf("%d", &x);
	scanf("%d", &y);
	
	while (x <= y) {
		sum += x;
		x += 1;
	}
	
	printf("%d\n", sum);
	
	return 0;
}