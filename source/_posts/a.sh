#!/bin/bash
#
workdir=$(cd $(dirname $0); pwd)
updated=$(date -d today +"%Y-%m-%d %T")
modifiFiles=$(git status)
modifiFiles=${modifiFiles#*modified:}
modifiFiles=${modifiFiles%%Untracked*}
modifiFiles=${modifiFiles%%no\ changes\ added\ to\ commit*}
modifiFiles=${modifiFiles//modified:/ }
echo $modifiFiles
arr=($modifiFiles)
for s in ${arr[@]}
do
	if [[ $(head -6 $s|tail -1) =~ updated\ : ]];then
		echo $s
		sed  -i  "6  d" $s
		sed -i "6 i\updated : ${updated}" $s
	fi
done
