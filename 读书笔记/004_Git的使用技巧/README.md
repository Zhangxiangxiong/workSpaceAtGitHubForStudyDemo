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
$ git add .
$ git commit -m "some message for this commit"

// 或合并成一句话
$ git commit -am "some ..."
~~~

3.2 如果是新增文件,那么在提交前,也必须执行添加操作 git add .。

~~~
$ git add .
// 表示将当前路径下的新增文件都增加到git托管中。
~~~

3.2.2 要有好习惯,经常检查git的状态和修改内容。

~~~
$ git status
$ git status -s
$ git diff
~~~

3.3 查看提交日志

~~~
$ git log
// 简约日志
$ git log --pretty=oneline
~~~

3.4 用于显示.git 所在路径。只要当前路径在子路径下既可找到库路径。
*git rev-parse --git-dir*

~~~

zhangxiangxiong:c Zhangxiangxiong$ git rev-parse --git-dir
/Users/SSM/Documents/GitTest/.git
zhangxiangxiong:c Zhangxiangxiong$ pwd
/Users/SSM/Documents/GitTest/a/b/c
zhangxiangxiong:c Zhangxiangxiong$ 

~~~


3.5 编辑配置文件,全局或局部配置文件 
$git config -e 

~~~
// system或局部配置
zhangxiangxiong:c Zhangxiangxiong$ git config -e
// 全局配置
zhangxiangxiong:c Zhangxiangxiong$ git config -e --global
~~~

3.6 本地备份库
首先需要将路径cd 到 .git 的上一层路径。
然后

~~~
$ git clone GitTest GitTest_back
//.git 在GitTest路径下面。
~~~

3.7 关于git 的提交说明。
	
3.7.1 git 的所有提交都要先将改动增加到stage(缓存中）中。如果在添加缓存前,希望撤销修改。 可以通过  # *git checkout -- fileName* 来撤销修改。


3.8 git 帮助文档

~~~
$git config help
~~~

3.9 忽略某些文件(不被git跟踪和更改提交)
在.git 的同级路径下编辑 .gitignore 文件

~~~
*.[oa]
*~
*.pyc
!test.pyc
foo/
**/res
build/
.DS_Store
~~~

*.[oa] 表示忽略所有以.a 或 .o结尾的文件。 
*~ 表示忽略所有~结尾的文件(一般是临时文件用~结尾)。 
*.pyc 表示忽略所有.pyc结尾的文件。 
!test.pyc 表示test.pyc 不被忽略,作为特殊的pyc文件纳入管理。 
foo/ 表示忽略当前路径下的foo 文件夹。 
**/res 表示忽略任何文件夹下饿 res文件夹。 


3.10 Git中的 HEAD 关键字的意义:
在Git中，用HEAD表示当前版本,也可以用当前版本的SHA 若干位的码表示当前版本。
那么上两个版本用 HEAD^^ 表示。
上三个版本用 HEAD^^^表示
上100个版本用 HEAD^100

3.11 如何控制版本的回退？
就是将hard 移动到当前HEAD的上一个版本 HEAD^

~~~
$ git reset --hard HEAD^
~~~

3.12 放弃已经提交的代码标准操作流程是

~~~
// 找到需要回滚到的版本SHA码,或直接用HEAD^ 表示上个版本
$ git reflog
40093af HEAD@{0}: reset: moving to 40093af
67e332f HEAD@{1}: reset: moving to HEAD^^
6eba484 HEAD@{2}: commit: AT 12:47
57873c0 HEAD@{3}: reset: moving to HEAD^
40093af HEAD@{4}: commit: add message At 12:44
57873c0 HEAD@{5}: commit: new line 21:10
67e332f HEAD@{6}: commit: add new line
221ea2e HEAD@{7}: commit (initial): add new file

// 回滚到 6eba484 HEAD@{2}: commit: AT 12:47 这个版本
$ git reset --hard 40093af

~~~


3.13 Git 的文件组织结构
	工作区:存放需要编辑,跟踪的文件。
	.git 路径下有
	Stage暂存区 和 若干分支(通常有master分支)
	
第一步是用*git add*把文件添加进去，实际上就是把文件修改添加到暂存区；

第二步是用*git commit*提交更改，实际上就是把暂存区的所有内容提交到当前分支

3.14 撤销修改

3.141 需要 $ git checkout -- filename 即可用库里的文件或Stage中的文件覆盖掉工作区的file。(用最后一次git commit 或 git add 文件状态覆盖掉那个文件)
注意 "--"这个很重要,如果是 git checkout filename，那么会切换到 filename这个分支上。

3.142 如果文件已经 git add 到Stage中,想放弃Stage中的修改。那么执行

~~~
git reset HEAD filename
~~~

所以 git reset 可以回退版本也可以放弃Stage区。再执行 3.141 完成覆盖


3.15 删除文件

1：首先在工作区用 rm 命令删除或鼠标拖动文件到垃圾箱中。
用 git status 可以发现git 察觉到文件已经被删了。

2.1 如果是误删,那么用 git checkout -- filename 可以恢复该文件。
2.2 如果确认删除。用 git add . 并且 git commit 提交删除。


3.16 创建远程库

关联一个远程库，使用命令

git remote add origin git@server-name:path/repo-name.git；

关联后，使用命令git push -u origin master第一次推送master分支的所有内容；

此后，每次本地提交后，只要有必要，就可以使用命令git push origin master推送最新修改；


3.17分支的作用

3.171 查看当前分支,以及其他分支

~~~
$ git branch
* master
~~~
星号标注了当前的分支。

3.172 创建并切换到新分支

~~~
$ git checkout -b dev
Switched to a new branch 'dev'

~~~

相当于

~~~
$ git branch dev
$ git checkout dev
Switched to branch 'dev'
~~~

3.173 在 dev 分支完成工作后,需要合并到master 分支上

~~~
$ git checkout master
Switched to branch 'master'

$ git merge dev
Updating d17efd8..fec145a
Fast-forward
 readme.txt |    1 +
 1 file changed, 1 insertion(+)
 
 $ git branch -d dev
Deleted branch dev (was fec145a).

$ git branch -D dev 
强制删除未合并的分支
~~~


小结

Git鼓励大量使用分支：

查看分支：git branch

创建分支：git branch <name>

切换分支：git checkout <name>

创建+切换分支：git checkout -b <name>

合并某分支到当前分支：git merge <name>

删除分支：git branch -d <name>



3.18 如何使用分支处理bug。

如果自己工作分支需要中断,并且工作区需要切换到master分支处理已经存在的bug。
那么首先应该保存当前工作状态(未commit状态)

~~~

$ git stash
Saved working directory and index state WIP on dev: 6224937 add merge
HEAD is now at 6224937 add merge

~~~

然后检测切换前的工作状态是否干净

~~~
$ git status
~~~

新建分支处理bug
~~~

$ git checkout master
Switched to branch 'master'
Your branch is ahead of 'origin/master' by 6 commits.
$ git checkout -b issue-101
Switched to a new branch 'issue-101'

~~~

提交bug处理情况
现在修复bug，需要把“Git is free software ...”改为“Git is a free software ...”，然后提交：

~~~
$ git add readme.txt 
$ git commit -m "fix bug 101"
[issue-101 cc17032] fix bug 101
 1 file changed, 1 insertion(+), 1 deletion(-)
 
$ git checkout master
Switched to branch 'master'
Your branch is ahead of 'origin/master' by 2 commits.
$ git merge --no-ff -m "merged bug fix 101" issue-101
Merge made by the 'recursive' strategy.
 readme.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git branch -d issue-101
Deleted branch issue-101 (was cc17032).
~~~

查看之前的冻结情况

~~~
$ git stash list
stash@{0}: WIP on dev: 6224937 add merge

// 恢复之前的工作区
$ git stash pop

~~~

3.19 标签

~~~
$ git tag v1.0
~~~

可以用命令git tag查看所有标签：

~~~
$ git tag
v1.0
~~~

追加标签

~~~
$ git tag v0.9 6224937
~~~

删除标签

~~~
$ git tag -d v0.1
Deleted tag 'v0.1' (was e078af9)
~~~

推送标签到远程

~~~
$ git push origin --tags
~~~



Test branch on GitHub

