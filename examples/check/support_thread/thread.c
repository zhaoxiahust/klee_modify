#include <pthread.h>
#include <stdio.h>
#include <string.h>

void *func(void *a)
{
	int m = *(int *)a;

	if(m > 80)
		printf("hello");
	else
		printf("not");
}

int main(int argc, char **argv)
{
	int m;
	pthread_t thread;
			
	klee_make_symbolic(&m, sizeof(m), "mm");


	pthread_create(&thread,NULL, func, &m);
		

}
