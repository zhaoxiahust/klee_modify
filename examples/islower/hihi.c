/*
 * First KLEE tutorial: testing a small function
 */

//#include <klee/klee.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

int aa(int b)
{
	if(b < 40)
		printf("aaaaaaaaaaaaa00000\n");		
	else
		printf("aaaaaaaaaaaa111111\n");

}

void *hi(void *ptr)
{
     int a = *(int *)ptr;			
	int b;
	pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
	
	pthread_mutex_lock(&mutex1);
	
//	printf("into hi function\n");
	// klee_make_symbolic(&a, sizeof(a), "input");
	/*
	if(a > 5)
		printf("nice follow your heart\n");
		*/
	if(b > 100)
			if(a > 20)
				printf("int hi00000\n");
			else
				printf("int hi111111\n");
	else
		aa(a);
//	int a = 10;
//	if(a > 20)
//		printf("hfas\n");		
/*
	 if(a > 5)
		printf("hell");
	 else
		printf("cry");

*/

	pthread_mutex_unlock(&mutex1);
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
	int d;
// char *name;
 // name = (char *)malloc(sizeof(char) *2);
 
	kain();

  klee_make_symbolic(&c, sizeof(c), "inputccccccc");
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
 	pthread_create(&thread1,NULL,hi,(void *)&c);
// 	pthread_create(0,NULL,0,0);
 
// 	fopen(name, "r");
// 	fopen("name", "r");
//
//
	if(d > 100)
		if(c > 0)
			printf("c main hi\n");
		else
			printf("c main cry\n");



/* 
   if(fopen(name, "r") == NULL)
   {
		printf("open error");		   
   }
   else
		printf("open succeed");
*/		

	pthread_join(thread1, NULL);

// return my_islower(c);
//	printf("main funciton out ok ok ok ok \n");
}
