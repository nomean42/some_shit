#!/usr/bin/env bash
LINEINT=0;

#get branch name
#todo addd get for relase and hotfix
BRANCHES=( $(hg branches | sed 's/\s/_/'| grep -e 'feature\/[[:digit:]][[:digit:]]\?[[:digit:]][[:digit:]]\?[[:digit:]][[:digit:]]\?'))
for i in "${BRANCHES[@]}"
    do
    #Build
    #create config
    done







#erase revision
sed 's/\s[[:digit:]][[:digit:]][[:digit:]][[:digit:]].*$//'


array0[${#array0[*]}]="новый2"