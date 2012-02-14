/*
 * First KLEE tutorial: testing a small function
 */

//#include <klee/klee.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>


void *hi(void *ptr)
{
//     int a = *(int *)ptr;			
	int a = *(int *)ptr;
//	int a = 3;
//	int a = ;
//	printf("into hi function\n");
// klee_make_symbolic(&a, sizeof(a), "input");
	/*
	if(a > 5)
		printf("nice follow your heart\n");
		*/
//	int a = 10;
//	if(a > 20)
//		aa(ptr);
//	else
		printf("fuck you\n");

//	 if(a > 5)
//		printf("hell");
//	 else
//		printf("cry");



//	printf("out hi function\n");
}
/*
int my_islower(int x) {
  if (x >= 'a' && x <= 'z')
    return 1;
  else return 0;
}
*/

int main(int argc, char **argv) {
    int c ;
	int b;
// char *name;
 // name = (char *)malloc(sizeof(char) *2);
  klee_make_symbolic(&c, sizeof(c), "inputccccc");
  klee_make_symbolic(&b, sizeof(b), "inputbbbbb");
//  klee_make_symbolic(name, sizeof(char)*2, "filename");
  pthread_t thread1;
  //malloc(sizeof(int));
  // putchar(2);
 // hi();
// 	printf(,"hi");
// strcmp(name, "hhi");
//
//
//
//
//
//
//
//
	if(c > 20)
	{
 		pthread_create(&thread1,NULL,hi,(void *)&b);
	} 
// 	fopen(name, "r");
// 	fopen("name", "r");
//
//
/*
	if(c > 0)
		printf("c main hi\n");
	else
		printf("c main cry\n");
*/


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
//	printf("main funciton out ok ok ok ok \n");
}
