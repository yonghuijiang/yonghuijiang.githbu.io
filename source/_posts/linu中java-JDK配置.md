---
title : linu中java-JDK配置
categories: java
tags : [java,jdk]
date : 2020-08-25 17:54:40
updated : 2020-08-25 18:11:53
---

注：以下内容以jdk1.0.0_181版本为参考物

##### 一、配置java环境变量

编辑修改/etc/profile配置文件

`vi /etc/profile`

在最末尾加入以下内容

`JAVA_HOME=/usr/java/jdk1.8.0_181`

`CLASSPATH=$JAVA_HOME/lib/`

`PATH=$PATH:$JAVA_HOME/bin`

`export PATH JAVA_HOME CLASSPATH`

##### **二、执行profile文件**

`source /etc/profile`

##### 三、**查看安装情况:**

`java -version`

##### 特别说明：

$JAVA_HOME代表引用$JAVA_HOME变量

$PATH<span style="color:red">:</span>中的<span style="color:red">:</span>相当于windows的;表示分割,表示在前一个$PATH后面追加其他path变量

**查看安装路径(已经配置好环境变量的情况下)**

`java -verbose`

