/*
 * First KLEE tutorial: testing a small function
 */

//test just a 
//kkkkkkkkk
//	printf("out hi function\n");

int main(int argc, char **argv) {
    int c ;
	int i;
  klee_make_symbolic(&c, sizeof(c), "input111111");
 	for(i = 0; i < c; i++)
  	{
		printf("hi");	  
 	}
}
