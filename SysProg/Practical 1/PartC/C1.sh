#!/bin/bash
for f in *
do
    echo  The number of characters in the file $f is
    wc -m $f
done
