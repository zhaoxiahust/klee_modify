/*
 * First KLEE tutorial: testing a small function
 */


int badAbs(char x)
{
//	klee_make_symbolic(&x, sizeof(x), "x");
	if(	x < 0)	
		return -x;
	if(x == 'K')
		return -x;

	return x;
}

int main(int argc, char **argv)
{
	
	char x = argv[1][0];
	badAbs(x);		
		
}
