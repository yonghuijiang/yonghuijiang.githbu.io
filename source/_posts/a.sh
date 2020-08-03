#!/bin/bash
#
workdir=$(cd $(dirname $0); pwd)
modifiFiles=$(git status)
modifiFiles=${modifiFiles#*modified:}
modifiFiles=${modifiFiles%%Untracked*}
modifiFiles=${modifiFiles//modified:/ }
arr=($modifiFiles)
for s in ${arr[@]}
do
    echo $(head -1 $s | tail -1)
done