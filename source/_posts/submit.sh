#!/bin/bash
#
workdir=$(cd $(dirname $0); pwd)
cd $workdir
workdir=$(cd $(dirname $0); pwd)
updated=$(date -d today +"%Y-%m-%d %T")
modifiFiles=$(git status -s | cut -c4-) 
echo ===========本次修改过的内容,D--删除，M--修改,??新增===========
echo "$(git status -s)" 
echo ===========================================
echo 需要更新时间的文件
arr=($modifiFiles)
for s in ${arr[@]} 
do
	if [[ -f "$s" && $(head -6 $s|tail -1) =~ updated\ : ]];then
		echo $s
		sed  -i  "6  d" $s
		sed -i "6 i\updated : ${updated}" $s
	fi
done
echo 更新时间结束
cd ../../
git config user.name "yonghuijiang"
git config user.email "1767247871@qq.com"
echo 添加文件至暂存区
git add .
echo ===========下面为本次需要提交的内容==========
echo ==========开始提交代码=========
git commit -m "Update docs"
echo ===========提交代码结束,准备拉取代码============
git pull
echo ============拉取代码代码结束，准备推送代码到远程分支============
git push
echo ========推送到远程分支结束==========

