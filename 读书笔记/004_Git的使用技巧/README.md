##004_Git的使用技巧


####1. 查看git的版本
~~~
$ git --version
~~~
这里可以看出Linux命令的基本规律。一般app的命令以该app的名字开头。如果需要带参数,那么需要使用 "--"后接参数全称。
"-"后接参数简写。

####2. 配置git的用户名和用户邮箱。这个作为日后提交的标记。

~~~
$ git config --global user.name "zhangxx"
$ git config --global user.email "241578393@qq.com"
~~~

####3. git的基本操作。
3.0 初始化库

~~~
$ git init
~~~

3.1 提交

~~~
$ git commit -m "some message for this commit"
~~~

3.2 如果是新增文件,那么在提交前,必须执行添加操作。

~~~
$ git add .
// 表示将当前路径下的新增文件都增加到git托管中。
~~~

3.3 查看提交日志

~~~
$ git log
~~~

