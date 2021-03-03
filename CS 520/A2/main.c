#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>
#define MAX_LINE 1024 //80 chars per line, per command

struct command
{
    const char **argv;//command will have arguments
};


struct command parse()
{
    printf("cssc2121%c ", '%');//prompt
    char user[MAX_LINE];//buffer for user input
    char *input[MAX_LINE];//MAX # of Args
    fgets(user, MAX_LINE, stdin);
    user[strlen(user) - 1] = '\0';//replace \n with \0
    input[0] = strtok(user, " ") ;
    int i = 0, j =0;
    while (input[i] != NULL)
    {
        input[++i] = strtok(NULL, " ");
    }


    i = 0;
    while(input[i] != NULL)
    {
        if (strcmp(input[0], "exit") == 0)
        {
            exit(0);
        }
        i = i+1;
    }

    int p[MAX_LINE];
    j = 1;
    int count =0;
    int numPipes = 0;

    i =0;
    while(input[i] != NULL)
    {
        count++;
        i++;
    }

    p[0]=0;

    for (i = 0; i< count; i++ )  //compute index of pipes if any.
    {
        if (input[i] == "|")
        {
            numPipes++;
            p[j++] = i;
        }
    }


    p[numPipes+1]=count;


    int k = 0;
    int l = 0;
    char *twoD[numPipes+1][MAX_LINE];


    for (k  = 0; k<numPipes+1; k++)
    {

        if (k== 0)
        {
            l = 0;
            for(i = p[k]; i<p[k+1]; i++)
            {

                twoD[k][l] = input[i];
            }
        }
        else
        {
            l=0;
            for(i = p[k]+1; i<p[k+1]; i++)
            {
                twoD[k][l] = input[i];
            }
        }
        l++;
    }

    struct command cmd;
    cmd.argv = twoD;

    return cmd;
}


int main(void)
{
    struct command result;
    result = parse();
    return 0;
}
