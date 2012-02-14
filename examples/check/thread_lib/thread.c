#include <pthread.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
	int m;
	pthread_t thread;
			
	klee_make_symbolic(&m, sizeof(m), "mm");

	if(m == 77)
	{
		printf("h");
	}

	pthread_join(thread, NULL);
}
