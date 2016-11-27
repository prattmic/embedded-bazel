#include <errno.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/times.h>

/*
 * Weak stub implementations for basic support for newlib.
 * Based on suggestions from
 * https://www.sourceware.org/newlib/libc.html#Syscalls.
 */

#define __weak __attribute__((weak))

#undef errno
extern int errno;

char *__env[1] = { 0 };
char **environ = __env;

void __weak _exit(int n) {
    while (1);
}

int __weak _close(int file) {
    return -1;
}

int __weak _execve(char *name, char **argv, char **env) {
    errno = ENOMEM;
    return -1;
}

int __weak _fork(void) {
    errno = EAGAIN;
    return -1;
}

int __weak _fstat(int file, struct stat *st) {
    st->st_mode = S_IFCHR;
    return 0;
}

int __weak _getpid(void) {
    return 1;
}

int __weak _isatty(int file) {
    return 1;
}

int __weak _kill(int pid, int sig) {
    errno = EINVAL;
    return -1;
}

int __weak _link(char *old, char *new) {
    errno = EMLINK;
    return -1;
}

int __weak _lseek(int file, int ptr, int dir) {
    return 0;
}

int __weak _open(const char *name, int flags, int mode) {
    return -1;
}

int __weak _read(int file, char *ptr, int len) {
    return 0;
}

caddr_t __weak _sbrk(int incr) {
    extern char _end;     /* Defined by the linker */
    static char *heap_end;
    char *prev_heap_end;

    if (heap_end == 0) {
        heap_end = &_end;
    }
    prev_heap_end = heap_end;

    // TODO(mpratt): detect stack collision

    heap_end += incr;
    return (caddr_t) prev_heap_end;
}

int __weak _stat(const char *file, struct stat *st) {
    st->st_mode = S_IFCHR;
    return 0;
}

int __weak _times(struct tms *buf) {
    return -1;
}

int __weak _unlink(char *name) {
    errno = ENOENT;
    return -1;
}

int __weak _wait(int *status) {
    errno = ECHILD;
    return -1;
}

// TODO(prattmic): EFM32 version UART.
int __weak _write(int file, char *ptr, int len) {
    errno = EFAULT;
    return -1;
}

int __weak _gettimeofday(struct timeval *tv, struct timezone *tz) {
    if (tv) {
        tv->tv_sec = 0;
        tv->tv_usec = 0;
    }
    errno = EINVAL;
    return -1;
}

// C++ bits to reduce included code.
typedef int __guard __attribute__((mode (__DI__)));

int __cxa_guard_acquire(__guard *g) {
    return !*(char *)(g);
}

void __cxa_guard_release(__guard *g) {
    *(char *)g = 1;
}

void __cxa_guard_abort(__guard *g) {
}

void __cxa_pure_virtual(void) {
    while(1);
}

int __cxa_atexit(void (*f)(void *), void *p, void *d){
    return 0;
}

int atexit(void (*f)(void)) {
}
