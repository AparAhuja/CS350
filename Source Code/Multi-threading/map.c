/* map.c
 * ----------------------------------------------------------
 *  CS350
 *  Assignment 1
 *  Question 1
 *
 *  Purpose:  Gain experience with threads and basic
 *  synchronization.
 *
 *  YOU MAY ADD WHATEVER YOU LIKE TO THIS FILE.
 *  YOU CANNOT CHANGE THE SIGNATURE OF MultithreadedWordCount.
 * ----------------------------------------------------------
 */
#include "data.h"
#include <stdlib.h>

/* --------------------------------------------------------------------
 * MultithreadedWordCount
 * --------------------------------------------------------------------
 * Takes a Library of articles containing words and a word.
 * Returns the total number of times that the word appears in the
 * Library.
 *
 * For example, "There the thesis sits on the theatre bench.", contains
 * 2 occurences of the word "the".
 * --------------------------------------------------------------------
 */

struct data{
    int cnt;
    int start;
    int end;
    char * word;
    struct Library * lib;
};

void* count(void* argss){
    struct data *arg = argss;
    for (unsigned int i = arg->start; i < arg->end; i ++)
    {
        struct Article * art = arg->lib->articles[i];
        for ( unsigned int j = 0; j < art->numWords; j++)
        {
            // Get the length of the function.
            size_t len = strnlen( art->words[j], MAXWORDSIZE );
            if ( !strncmp( art->words[j], arg->word, len ) )
            {
                arg->cnt += 1;
            }
        }
    }
    return NULL;
}

int min(int a, int b){
    return a>b?b:a;
}
size_t MultithreadedWordCount( struct  Library * lib, char * word)
{
    printf("Parallelizing with %d threads...\n",NUMTHREADS);
    pthread_t p[NUMTHREADS];
    struct data thread_data[NUMTHREADS];
    size_t wordCount = 0;
    
    for(int i = 0; i < NUMTHREADS; i++){
        thread_data[i].cnt = 0;
        thread_data[i].lib = lib;
        thread_data[i].word = word;
        thread_data[i].start = i*(lib->numArticles)/NUMTHREADS;
        thread_data[i].end = min((i+1)*(lib->numArticles)/NUMTHREADS, (lib->numArticles));
        pthread_create(&p[i], NULL, &count, (void*) (&thread_data[i]));
    }
    
    for(int i = 0; i < NUMTHREADS; i++){
        pthread_join(p[i], NULL);
        wordCount += thread_data[i].cnt;
    }
    
    return wordCount;
}
