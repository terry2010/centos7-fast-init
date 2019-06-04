# 安装注意

1. 安装前

编辑lnmp.sh ，修改 数据库密码 MYSQL_ROOT_PASSWORD=weibo.com  为真实密码

编辑data1/conf/ss/config.json ， 设置真实密码和端口

编辑vps.sh 修改 9999:9999 （服务器端口:docker端口） 为真实端口


2. 执行顺序

vps.sh  初始化环境

lnmp.sh 安装lnmp


3. 无头chrome的docker启动
```
docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /data1/data/chrome/:/data alpeware/chrome-headless-trunk
```

4. 常用docker命令

#重启nginx

docker restart my-nginx 

#进入docker执行命令

docker exec -it  my-php /bin/bash

5. 其他

 ```
  yum makecache
Loaded plugins: fastestmirror, langpacks
base                                                                                                                                                                                 | 3.6 kB  00:00:00     


 One of the configured repositories failed (Unknown),
 ```
 
 删除默认库 
 rm -f mv /etc/yum.repos.d/epel.repo
 换ali源
 wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
 yum makecache
 
