#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
char *infile = NULL;
char *outfile = NULL;
char * accept_input(){
    char * input;
    char c;
    input = (char *)malloc(sizeof(char) * 1000);
    scanf("%c", &c);
    for(int i = 0; i <1000 && c!='\n' && c!='\r'; i++){
        input[i] = c;
        scanf("%c", &c);
    }
    return input;
}
char* tokens[100];
char** tokenize(char * input, int * len){
    const char delimitor[2] = " ";
    char * token = strtok(input, delimitor);
    int i = 0;
    while(token!=NULL){
        tokens[i] = token; i++;
        token = strtok(NULL, delimitor);
    } tokens[i] = NULL;
    *len = i;
    return tokens;
}

void execute(char * input){
    system(input);
    exit(1);
}

int isBuiltIn(char** tokens, int len){
    if(strcmp(tokens[0], "cd") == 0 && len <= 2)
        return (1==1);
    if(strcmp(tokens[0], "pwd") == 0 && len == 1)
        return (1==1);
    if(strcmp(tokens[0], "wait") == 0 && len == 1)
        return (1==1);
    if(strcmp(tokens[0], "exit") == 0 && len == 1)
        return (1==1);
    if(strcmp(tokens[0], "help") == 0 && len == 1)
        return (1==1);
    return (1==0);
}

void cd_1(){
    chdir(getenv("HOME"));
    //printf("EXECUTED\n");
}
void cd_2(char* dir){
    chdir(dir);
}
void pwd(){
    char currdir[2048];
    getcwd(currdir, sizeof(currdir));
    printf("%s\n", currdir);
}
void wait_builtin(){
    wait(NULL);
}
void exit_builtin(){
    exit(0);
}
void help(){
    printf("%s\n%s\n%s\n%s\n%s\n", "cd", "pwd", "wait", "exit", "help");
}

int main( int argc, char ** argv )
{
    printf("> ");
    //int stdin = dup(0);
    //int stdout = dup(1);
    int len = 0;
    while(1){
        char * input;
        input = accept_input();
        char ** tokens = tokenize(input, &len);
//        for(int i = 0; i <100;i++){
//            printf("%s ", tokens[i]);
//        }printf("\n");
        if(isBuiltIn(tokens, len)){
            //printf("BUILTIN\n");
            if(strcmp(tokens[0], "cd") == 0 && len == 1)
                cd_1();
            else if(strcmp(tokens[0], "cd") == 0 && len == 2)
                cd_2(tokens[1]);
            else if(strcmp(tokens[0], "pwd") == 0)
                pwd();
            else if(strcmp(tokens[0], "wait") == 0)
                wait_builtin();
            else if(strcmp(tokens[0], "exit") == 0)
                exit_builtin();
            else if(strcmp(tokens[0], "help") == 0)
                help();
            printf("> ");
        }
        else{
            //printf("NOT BUILTIN\n");
            pid_t pid;
            switch (pid = fork()) {
                case -1:
                    perror("fork");
                    break;
                case 0:
                    execute(input);
                default:
                    waitpid(pid, NULL, 0);
                    printf("> ");
                    break;
            }
        }
    }
    return 0;
  
    return 0;
}
