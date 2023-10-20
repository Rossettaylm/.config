#!/bin/bash

if [[ $1 = "-r" ]]; then
    FILENAME=$2
    FILENAME_LENGTH=`expr length $FILENAME`
    NEW_FILENAME=`echo $FILENAME | cut -c -$[$FILENAME_LENGTH-3]`

    nvim $FILENAME && chmod 700 $FILENAME && mv $FILENAME $NEW_FILENAME
else 
    FILENAME=$1
    nvim $FILENAME && chmod 700 $FILENAME
fi
