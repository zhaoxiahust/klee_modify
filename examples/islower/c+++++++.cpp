#include <klee/klee.h>
#include <iostream>
class a{
public:
	int a;	
	int mm(int a);
};

int a::mm(int a)
{
	if(a > 0)		
		std::cout << "hhhhhhhhh\n";
	else
		std::cout<<"ssssss\n";
}

int main(int argc, char **argv)
{
	class a b;		
	int m;
	klee_make_symbolic(&m, sizeof(int), "m");

	b.mm(m);
}
