#!/usr/bin/env bash
LINEINT=0;

#get array with branch name without revisions
#todo add get for relase and hotfix
BRANCHES=( $(hg branches|sed 's/ [0-9].*$//'|grep -e 'feature\/[0-9]\+' -e 'hotfix\/[0-9]\+' -e 'release\/*[0-9]\+.[0-9]\+.[0-9]\+') )
echo ${BRANCHES[@]}
for BRANCH in "${BRANCHES[@]}"
    do
    echo $BRANCH
    done


hg log -l 1
#branch from last log
hg log -l 1|grep -e '[0-9]\+\:*'|tail -3|sed '1d'|sed '$d'|sed 's/ветка://'|sed 's/ *//'

#revision from last log
hg log -l 1|grep -e '[0-9]\+\:*'|tail -3|sed '$d'|sed '$d'|sed 's/набор изм-й://'|sed 's/ *//'





#erase revision
sed 's/ [0-9].*$//'


array0[${#array0[*]}]="новый2"