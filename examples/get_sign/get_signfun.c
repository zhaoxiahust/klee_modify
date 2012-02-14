/*
 * First KLEE tutorial: testing a small function
 */


int get_sign(char x) {
  if (x == 'a')
     return 0;
  
  if (x < 'a')
     return -1;
  else 
     return 1;
} 

int main(int argc, char *argv[]) {
		char a;
   		klee_make_symbolic(&a, sizeof(a), "a");
  		return get_sign(a);
} 
