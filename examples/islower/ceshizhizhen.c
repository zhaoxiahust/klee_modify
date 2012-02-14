/*
 * First KLEE tutorial: testing a small function
 */

#include <klee/klee.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>


void *hi(void *ptr)
{
//     int a = *(int *)ptr;			
	int a;
	 klee_make_symbolic(&a, sizeof(a), "input");
	 if(a > 5)
		printf("hell");
	 else
		printf("cry");
}

int my_islower(int x) {
  if (x >= 'a' && x <= 'z')
    return 1;
  else return 0;
}

int main(int argc, char **argv) {
  int c ;
  char *name;
 // name = (char *)malloc(sizeof(char) *2);
//  klee_make_symbolic(&c, sizeof(c), "input");
  hi(&c);
//  klee_make_symbolic(name, sizeof(char)*2, "filename");
//  pthread_t thread1;
  //malloc(sizeof(int));
  // putchar(2);
 // hi();
// 	printf(,"hi");
// strcmp(name, "hhi");
// 	pthread_create(&thread1,NULL,hi,(void *)&c);
// 	pthread_create(0,NULL,0,0);
 
// 	fopen(name, "r");
// 	fopen("name", "r");
/* 
   if(fopen(name, "r") == NULL)
   {
		printf("open error");		   
   }
   else
		printf("open succeed");
*/		

//	pthread_join(thread1, NULL);

// return my_islower(c);
}
