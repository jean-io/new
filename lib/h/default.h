#ifndef _HEADER_MAIN_
#define _HEADER_MAIN_

#define _GNU_SOURCE

/* Include locaux */

/* Include globaux  */

// Basique

#include <features.h>

#include <stdio.h>
#include <stdlib.h>

#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <pthread.h>

// Systeme

#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <fcntl.h>

// Reseau

#include <netinet/in.h>
#include <net/if.h>
#include <arpa/inet.h>
#include <netdb.h>

/* Defines */

#define CONTINUER 1
#define BUFFERSIZE 1024
#define __SUCCESS_ERRNO__ 0
#define __ERROR_CREAT__ -1
#define __ERROR_FORK__ -1
#define __ATTENTE__ sleep(2);

/* Enum */

/* Structures */

/* Prototypes */

void fin_programme(void);

/* Extern */

extern int errno;
extern char **environ;


#endif
