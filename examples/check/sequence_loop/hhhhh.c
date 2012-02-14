/*
 * First KLEE tutorial: testing a small function
 */

//	printf("out hi function\n");

int main(int argc, char **argv) {
    int c ;
	int i;
	int cc;
  klee_make_symbolic(&c, sizeof(c), "input111111");
  klee_make_symbolic(&cc, sizeof(cc), "input22222");
 	for(i = 0; i < c; i++)
  	{
		printf("hi");	  
 	}
 	for(i = 0; i < cc; i++)
  	{
		printf("world");	  
 	}
}
