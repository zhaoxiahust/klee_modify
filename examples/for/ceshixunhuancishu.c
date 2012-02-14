/*
 * First KLEE tutorial: testing a small function
 */

//	printf("out hi function\n");

int main(int argc, char **argv) {
    int c = 100;
	int i;
	int j;
	int cc = 100;
	int mm;
	int kk;
//	cc = argv[3][0];
//	mm = argv[3][1];
  klee_make_symbolic(&c, sizeof(c), "input111111");
  klee_make_symbolic(&kk, sizeof(kk), "inputkkkkkkkk");
  for(j = 0; j < kk; j++)
  {
		  if(c > 999)
				  printf("hi");
		  else
				  printf("no");
  }
 	//	for(i = 0; i < c; i++)
  	//	{
	//		printf("hi");	  
 	//	}
}
