#include "assignment.h"
#include <stdio.h>
void
consume_enter(struct resource *resource)
{
    // FILL ME IN
    pthread_mutex_lock(&resource->mutex);
    while ((resource->num_consumers + 1) > resource->num_producers * resource->ratio) {
        pthread_cond_wait(&resource->cond, &resource->mutex);
    }
    resource->num_consumers += 1;
    //pthread_cond_broadcast(&resource->cond);
    //pthread_mutex_unlock(&resource->mutex);
}

void
consume_exit(struct resource *resource)
{
    // FILL ME IN
    //pthread_mutex_lock(&resource->mutex);
    resource->num_consumers -= 1;
    pthread_mutex_unlock(&resource->mutex);
    pthread_cond_broadcast(&resource->cond);
}

void
produce_enter(struct resource *resource)
{
    // FILL ME IN
    pthread_mutex_lock(&resource->mutex);
    resource->num_producers += 1;
    //pthread_mutex_unlock(&resource->mutex);
    pthread_cond_broadcast(&resource->cond);
}

void
produce_exit(struct resource *resource)
{
    // FILL ME IN
    //pthread_mutex_lock(&resource->mutex);
    while (resource->num_consumers > (resource->num_producers - 1) * resource->ratio) {
        pthread_cond_wait(&resource->cond, &resource->mutex);
    }
    resource->num_producers -= 1;
    //pthread_cond_broadcast(&resource->cond);
    pthread_mutex_unlock(&resource->mutex);
}


