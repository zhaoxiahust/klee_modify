/*
 * First KLEE tutorial: testing a small function
 */

//#include <klee/klee.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <pthread.h>


int main(int argc, char **argv) {
    int c ;
	int b;
	pthread_mutex_t aa;
	pthread_t vb;
	pthread_cond_t cc;
// char *name;
 // name = (char *)malloc(sizeof(char) *2);
//  klee_make_symbolic(&c, sizeof(c), "inputccccc");
//
	b = c;
//
	if(b > 20)
	{
		printf("hi");
	} 
	else
	{
		printf("kkk");			
	}

//	pthread_join(thread1, NULL);

// return my_islower(c);
//	printf("main funciton out ok ok ok ok \n");
}
