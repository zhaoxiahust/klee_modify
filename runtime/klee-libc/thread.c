#include <pthread.h>
#include <signal.h>


int pthread_join(pthread_t a, void **b)
{
	;		
}
int pthread_kill(pthread_t a, int sig)
{
	;		
}
int pthread_mutex_lock(pthread_mutex_t *mutex)
{
	;
}
int pthread_mutex_unlock(pthread_mutex_t *mutex)
{
	;
}
int pthread_cond_signal(pthread_cond_t *cond)
{
	;	
}
int pthread_cond_broadcast(pthread_cond_t *cond)
{
	;		
}
int pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex)
{
	;		
}
int pthread_cond_timedwait(pthread_cond_t * cond, pthread_mutex_t * mutex, const struct timespec * a)
{
	;		
}
int pthread_sigmask(int how, const sigset_t *set, sigset_t *oldset)
{
	;		
}
int pthread_attr_init(pthread_attr_t *attr)
{
	;		
}
int pthread_attr_setstacksize(pthread_attr_t *attr, size_t stacksize)
{
	;		
}
int pthread_mutex_init(pthread_mutex_t * mutex, const pthread_mutexattr_t * attr)
{
	;
}
int pthread_mutex_destroy(pthread_mutex_t *mutex)
{
	;		
}
int pthread_cond_init(pthread_cond_t * cond,const  pthread_condattr_t * attr)
{
	;
}
int pthread_cond_destroy(pthread_cond_t * cond)
{
	;		
}



int kain(void)
{
;		
}
