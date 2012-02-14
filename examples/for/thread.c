#include <pthread.h>
#include <stdio.h>
#include <string.h>

void *func(void *a)
{
	int m = *(int *)a;
	int hi;

	for(hi = 0; hi > 10; hi++)
	if(m > 80)
		printf("hello");
	else
		printf("not");
}

int main(int argc, char **argv)
{
	int m;
	int mm;
	int flag;
	pthread_t thread;
			
	klee_make_symbolic(&m, sizeof(m), "mm");

	if(mm == 77)
	{

	    pthread_create(&thread,NULL, func, &m);
	}
		

}
