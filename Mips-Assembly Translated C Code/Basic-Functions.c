int x = 0, y = 0;

int main(void) {
	x = 2;
	y = 3;
	
	printf("%d %d\n", x, y);
	f();
	
	printf("DONE!\n");
}

void dec_x() {
	x--;
	printf("%d\n", x);
	
	dec_y();
	return;
}

void dec_y() {
	y--;
	printf("%d\n", y);
	
	return;
}