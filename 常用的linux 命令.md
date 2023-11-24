# 常用的linux 命令

## bash

### 文件操作

```shell
# 文件内容查找（或者使用notepad++ Find 功能）
grep -i "bbiboll" . -r -n

# 级联新建文件夹
mkdir -p src/main/java/hello

# 删除指定的maven依赖库
rm -r /d/repository/com/jd/judgement/

# 解压
tar -zxvf apache-zookeeper-3.5.5-bin.tar.gz

# 复制 ssh 公钥到粘贴板
cat ~/.ssh/id_rsa.pub | clip

# 批量创建文件
touch file{1..5}.txt

# 按照行数(-l 100)，切分文本文件(以数字后缀结尾)
split -l 100 -d -a 3 source.txt target_

# 查找文件
find ./Java -size +10240k -name '*.dll' > tmp.txt
```

### 配置

路径：D:\Users\yangpan3\AppData\Local\Programs\Git\etc\bash.bashrc

> alias gpp='git pull; git push;'

## npm

### nodeJs

```bash
 # demo 工程一条龙 🎯
 git clone -b sample-distance-matrix https://github.com/googlemaps/js-samples.git
 cd js-samples
 npm i
 npm start
```

### vue-cli

```bash
# 安装
npm install -g @vue/cli
创建一个项目
vue create my-project
# 启动服务
cd my-project
npm run serve
```

## git

```shell
# 查看git库地址
git remote -v

# 远程分支回滚（强制推送到远程分支）
git reset --hard a7e1d279
git push -f origin master

#未提交内容暂存到本地
git stash
git stash apply

*// 指定还原`aaa.html`文件*
git checkout -- aaa.html             

*// 还原所有文件*
git checkout -- *                     

# 回退到上一个版本，注意看HEAD后面有个 ^
# HEAD^ 是回退到上个版本
# HEAD^^ 是回退到上上个版本
# HEAD~数字 是回退到数字个版本
git reset HEAD^

#  回退到当前版本
git reset HEAD


# 删除分支
git branch -D fix-xxx
git push origin -d fix-xxx


# 新建分支
git checkout -b fix-safe-fastjson
git push -u origin fix-safe-fastjson

# git 配置查看。 独立配置可以在工程文件夹/.git/config 修改
git config --list
git config user.name
```

### 回退到某个版本

```shell
git log ，查看分支提交历史，确认需要回退的版本，获取 commit_id
git reset --hard <commit_id> 命令，进行版本回退
git push origin -f <branch_name>，推送至远程分支
```

## java

```sh
# Take a quick peek JAR file
jar tvf build/libs/gs-gradle-0.1.0.jar

# 反编译字节码
javap -verbose -p Main.class


# 查看到堆内对象示例的统计信息
jmap -histo:live pid | head -n 10

mvn clean package -DskipTests
```

## ffmpeg

```shell
# FFmpeg 提取视频的音频 
ffmpeg -i sample.mp4 -q:a 0 -map a sample.mp3
```
