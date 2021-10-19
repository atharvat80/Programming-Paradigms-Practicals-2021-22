#!/bin/bash

tr '\!@\$%' '1234' < file.txt | tr '[:upper:]' '[:lower:]' | tr '\t' ',' > changed.txt