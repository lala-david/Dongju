#include <stdio.h>
// 문제 : 10보다 작은 수가 입력되면 small을 출력하는 코드를 작성하시오.

#include<stdio.h>
int main(){
	int a;
	scanf("%d", &a);
	if(a < 10)
		printf("small");
	return 0;
}