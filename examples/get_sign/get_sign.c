/*
 * First KLEE tutorial: testing a small function
 */



int main(int argc, char *argv[]) {
  if (argv[0][0] == 'a')
     return 0;
  
  if (argv[0][0] < 'a')
     return -1;
  else 
	return 1;
} 
