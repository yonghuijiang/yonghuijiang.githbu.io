---
title : idea进行远程调试
categories: idea
tags : [idea]
date : 2020-12-08 12:15:50
updated : 2020-12-08 12:15:50
---

##### 一、远程调试(只有在无法直接调试时才检查该设置)

使用特定JVM参数运行服务端代码

在启动项目的时候加上特定的JVNM参数

```bash
-Xdebug -Xrunjdwp:transport=dt_socket,suspend=n,server=y,address=${debug_port}
```

其中的`${debug_port}`是用户自定义的，为debug端口

这里有一个坑，如果发布的应用所有JVM参数列表中与远程调试相关的JVM启动参数如下：

```
-Xdebug -Xrunjdwp:transport=dt_socket,suspend=n,server=y,address=127.0.0.1:15555
```

将address设置为`127.0.0.1:15555`，表示将调试端口限制为本地访问，远程无法访问，我们在自己设置JVM的启动参数时也需要格外注意。

如果只是临时调试，在端口号前面不要加上限制访问的IP地址，调试完成之后，将上述JVM参数去除掉之后重新发布下，防范开放远程调试端口可能带来的安全风险。

##### 二、本地连接远程服务器debug端口

打开Intellij IDEA，

在顶部靠右的地方选择”Edit Configurations…”，

进去之后点击+号，

选择”Remote”，

按照下图的只是填写红框内的内容，

其中Name填写名称，这里为`remote webserver`，

host为远程代码运行的机器的ip/hostname，

port为上一步指定的debug_port，本例是`15555`。然后点击Apply，最后点击OK即可

![](.\资源包\idea\idea远程调试配置.png)

##### 三、本地IDEA启动debug模式

现在在上一步选择”Edit Configurations…”的下拉框的位置选择上一步创建的`remote webserver`，然后点击右边的`debug`按钮(长的像臭虫那个)，看控制台日志，如果出现类似“Connected to the target VM, address: ‘xx.xx.xx.xx:5555’, transport: ‘socket’”的字样，就表示连接成功过了。我这里实际显示的内容如下：

```
Connected to the target VM, address: '10.185.0.192:15555', transport: 'socket'
```