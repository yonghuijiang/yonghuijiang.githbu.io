#! /bin/bash
modifiedFile=$(git status)
temp=${modifiedFile#*"modified: "}
tempString=${temp%%"Untracked files"*}
echo  ${tempString//"modified: "/" "}
tempArray=(${tempString//"modified: "/" "})

echo "Intel Galileo" >> ${tempArray[2]}
#for i in ${tempArray[@]}
#do
#echo $i
#done