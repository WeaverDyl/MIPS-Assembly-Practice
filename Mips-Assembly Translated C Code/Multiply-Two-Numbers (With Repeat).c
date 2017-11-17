int number= 0, factor= 0, result= 0, current_iteration= 0, repeat= 1;

int main(void) {
	printf("Enter a number:\n");
	scanf("%d", &number);
	printf("\n\Enter a multiplying factor:\n");
	scanf("%d", &factor);
	
	while (current_iteration < factor) {
		result += number;
		current_iteration += 1;
	}
	
	printf("\nThe number multiplied by the factor is:\n%d", result);
	printf("\nWould you like to try again? (0 = yes)\n");
	
	scanf("%d", &repeat);
	
	if (repeat == 0) {
		main();
	}
	
	return 0;
}