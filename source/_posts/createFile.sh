#!/bin/bash
#
#Shell Syntax error : end of file unexpected (expecting “then”) 
#可以输入:set fileformat=unix修改ubuntu 和linux服务器、 dos等非图形界面冲突
#通过改模板快速创建文章
#title: WSL使用ssh
#categories: WSL
#tags: [ssh,ubuntu,sshd]
#date: 2017-11-22 22:12:28 创建时间 
#updated: 2017-12-13 11:00:13 更新时间
echo '开始创建文章'
read -p "标题名,也是文件名(不许有空格哦)：" title  #标题也是文件名
if [ "$title" = "" ];then
echo "-------------文件名不为空-------------"
exit 1
fi
read -p "分类名：" categories #categories = $2 #分类
read -p "标签名,如[ssh,ubuntu,sshd]：" tags #tags = $3 #标签 英文逗号分离
date=$(date -d today +"%Y-%m-%d %T")
updated=$(date -d today +"%Y-%m-%d %T")
echo --- > $title.md
echo title : ${title} >> $title.md
echo categories: ${categories} >> $title.md
echo tags : ${tags} >> $title.md
echo date : ${date} >> $title.md
echo updated : ${updated} >> $title.md
echo --- >> $title.md
echo '创建成功'

