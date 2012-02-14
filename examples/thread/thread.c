#include <pthread.h>
#include <stdio.h>
#include <string.h>

void *func(void *a)
{
	int m;
	klee_make_symbolic(&m,sizeof(m), "m");		

	if(m == 0)
		printf("hello");
	else
		printf("not");
}

int main(int argc, char **argv)
{
	int m;
	int flag;
	char *file;
	pthread_t thread;
			
	klee_make_symbolic(&m, sizeof(m), "mm");
	//klee_make_symbolic(file, sizeof(char *), "filename");
//	klee_make_symbolic(&flag, sizeof(flag), "flag");

	if(m == 77)
	{
			/*
		int fd;
		fd = fopen(file, flag);
		if(fd == 0)
			printf("0");
		else
			printf("1");
*/
		printf("h");
	}
	//pthread_create(&thread,NULL, func, 0);
	/*
	if(0 == strcmp(file, "hi"))
	{
		printf("re")	;
	}		
	else
	{
		printf("j");		
	}
	*/	

	pthread_join(thread, NULL);
}
