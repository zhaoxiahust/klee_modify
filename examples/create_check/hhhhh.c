/*
 * First KLEE tutorial: testing a small function
 */

//	printf("out hi function\n");

int main(int argc, char **argv) {
    int c ;
  klee_make_symbolic(&c, sizeof(c), "input111111");

  if(c > 100)
  {
	printf("into >100\n");		  
  }
  else
	printf("into <=100\n");
}
