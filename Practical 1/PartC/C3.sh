#!/bin/bash
if [ $1 -eq 1 ]
then
  if [ ! -d MyTextFiles ]
  then
    mkdir MyTextFiles
  fi
  cp *.[tT][xX][tT] MyTextFiles/
else
  if [ ! -d MyTextFiles ]
  then
    echo Warning: Directory MyTextFiles does not exist
  fi
  mv MyTextFiles/* ./
fi 

ls MyTextFiles > DirectoryListing.txt
wc -l DirectoryListing.txt
