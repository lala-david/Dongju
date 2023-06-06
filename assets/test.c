//
// Created by DH on 2023-02-10.
//
#include <stdio.h>
#include <malloc.h>

typedef struct meetingroom{
    int start;
    int end;
}meetingroom;

int main(){
    int n;
    scanf("%d", &n);
    meetingroom *mt = (meetingroom*)malloc(sizeof(meetingroom)*n);

    for(int i = 0; i<n; i++){
        scanf("%d %d", &mt[i].start, &mt[i].end);
    }
    return 0;
}