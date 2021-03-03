/*
Names: Isaac Pacheco and Isaia Pacheco
Class Accounts cssc2100 and cssc2121
Assignment Information: Assignment #1, Thread Manager
*/
#include "bots.h"
#define NUM_THREADS 7
#define MAX_ITERATIONS 8
#define EVEN_SECONDS 2
#define ODD_SECONDS 3
#define BUFFER_LENGTH 100000
sem_t FLAG;//create a semaphore named FLAG
/*
 function: even
 Notes: this function serves as the work done by threads with thread id's that are even.
 I/O: has one input parameter which is the thread ID as an integer. has no output.
*/
void even(pthread_t threadID)
{

    int j = 0;
    for(j = 0; j< MAX_ITERATIONS; j++)
    {
        sem_wait(&FLAG);
        FILE * fp; //create a file pointer
        fp = fopen ("QUOTE.txt","a");//open the file QUOTE.txt

        char buffer[BUFFER_LENGTH];
        sprintf(buffer,"%ld", threadID);//convert threadID to string

        //lines 36-48 concatenates the threadID and the even quote together
        char s1[] = "Thread<";
        strcat(s1, buffer);
        strcat(s1, "> Even numbered threads: Controlling complexity is the essence of computer programming.--Brian Kernigan\r\n");
        fputs(s1,fp); //write the threadID and quote to the file
        printf("Thread <%ld> is running\n",threadID);

        fclose(fp); // close the file
        sem_post(&FLAG);
    }

}

/*
 function: odd
 Notes: this function serves as the work done by threads with threads id's that are odd.
 I/O: has one input parameter which is the thread ID as an integer. has no output.
*/
void odd(pthread_t threadID)
{

    int k = 0;
    for(k = 0; k < MAX_ITERATIONS; k++)
    {
        sem_wait(&FLAG);
        FILE * fp = NULL; //create a file pointer
        fp = fopen ("QUOTE.txt","a");//open the file QUOTE.txt

        char buffer[BUFFER_LENGTH];
        sprintf(buffer,"%ld", threadID);////convert threadID to string

        //lines 59-61 concatenates the threadID and the odd quote together
        char s1[] = "Thread<";
        strcat(s1, buffer);
        strcat(s1, "> Odd numbered threads: Computer science is no more about computers than astronomy is about telescopes. --Edsger Dijkstra\r\n");
        fputs(s1,fp); //write the threadID and quote to the file
        printf("Thread <%ld> is running\n",threadID);//print threadID to console

        fclose(fp); // close the file
        sem_post(&FLAG);
    }

}

/*
 function: loop
 Notes: this function determines if a thread is even or odd
*/
void *loop()
{
   // int *p = (int*) pArg;
    pthread_t threadID = pthread_self();
    if(threadID % 2 == 0)
    {
        sleep(EVEN_SECONDS);
        even(threadID);
    }
    else
    {
        sleep(ODD_SECONDS);
        odd(threadID);
    }
}


int main()
{
    int i = 0;
    FILE * fp = NULL; //create a file pointer
    fp = fopen ("QUOTE.txt","w");//create a file named QUOTE.txt, in cwd

    if (fp == NULL)
    {
        printf("Error opening file\n");
    }


    else
    {

        pid_t pid = getpid();//get the process id
        fprintf(fp, "pid: %ld\r\n",pid);  //write the pid to the file
        fclose(fp); // close the file
        pthread_t tid[NUM_THREADS];
        sem_init(&FLAG, 0, 1); //initialize semaphore FLAG to 1
        for(i = 0; i < NUM_THREADS; i++)
        {
            pthread_create(&tid[i], NULL,*loop, NULL);
        }

        for(i = 0; i < NUM_THREADS; i++)
        {
            pthread_join(tid[i],(void *) NULL);
        }
       // sem_destroy(&FLAG);//destroy semaphore
        printf("Bye World :D");//print user friendly message
        pthread_exit(NULL);//exit pthread
    }
    return 0;
}
