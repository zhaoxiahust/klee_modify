/*
 * First KLEE tutorial: testing a small function
 */

//	printf("out hi function\n");

int main(int argc, char **argv) {
    int c ;
	int i;
	int j;
	int cc = 100;
	int mm;
	int kk;
//	cc = argv[3][0];
//	mm = argv[3][1];
    klee_make_symbolic(&kk, sizeof(kk), "inputkkkkkkkk");

    if(j > 100)
		  if(mm > 200)
				  if(c > 300)
						 if(kk > 400)
								printf("kkkkkkkkkkkkkkkkkkkkkkk\n");
}
