#!/bin/bash

# tr '\n' ' ' < input.txt
# tr -dc [:print:]
# tr -d '_";{}[]()!:#$%@^&0-9*.,-' or tr -dc '[:alpha:] '
# tr ' ' '\n'
# tr [:upper:] [:lower:]
# sort
# uniq > dictonary.txt

tr '\n' ' ' < input.txt | tr -dc [:print:] | tr -d '_";{}[]()!:#$%@^&0-9*.,-' | tr ' ' '\n' | tr [:upper:] [:lower:] | sort | uniq > dictonary.txt