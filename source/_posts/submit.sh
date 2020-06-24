#!/bin/bash
#
workdir=$(cd $(dirname $0); pwd)
cd $workdir
cd ../../
git config user.name "yonghuijiang"
git config user.email "1767247871@qq.com"
git add .
git commit -m "Update docs"
git pull
git push

