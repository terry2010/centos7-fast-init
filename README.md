# centos7-fast-init
最小化安装centos7 之后， 快速初始化环境， 使新机器最短时间可以上线作为开发机/生产机使用

## 一键安装

```
yum install -y wget git vim lrzsz screen net-tools telnet iftop bind-utils &&\
wget "https://raw.githubusercontent.com/terry2010/centos7-fast-init/master/vps/fast.sh" &&\
screen sh fast.sh
ip a


```
 

## 快速上线
#### 需要先修改 vps.sh  
```
yum install -y wget git vim lrzsz screen net-tools telnet iftop &&\
git clone https://github.com/terry2010/centos7-fast-init.git &&\
screen -S install
scp  root@xxxxxxxxxxxxxxx.com:/data1.tar.gz /data1.tar.gz 



 
cd /  &&\
tar -xzf data1.tar.gz &&\
cd /root/centos7-fast-init/vps/ 

####需要先修改 vps.sh 

screen sh vps.sh


screen sh lnmp.sh 




```


## 新上架机器后， 启用网卡
```
vi /etc/sysconfig/network-scripts/ifcfg-ens33
```

#修改 ONBOOT=no  为 ONBOOT=yes

#重启网络服务
```
service network restart
```
#查看ip
```
ip addr
```


#可选项目
```
yum install -y wget  git vim lrzsz screen net-tools telnet
```
## 替换yum源为ali源

#备份
```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```
#替换
```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
```
#下载fedora的epel仓库
```
yum install -y epel-release
```
#刷新数据
```
yum makecache
```
#更新到最新
```
screen yum update -y
```
------
> 可选操作：

### 更新时区
```
yum install -y ntp
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'Asia/Shanghai' >/etc/timezone
ntpdate time.windows.com

```

