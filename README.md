# centos7-fast-init
最小化安装centos7 之后， 快速初始化环境， 使新机器最短时间可以上线作为开发机/生产机使用


# 新上架机器后， 启用网卡

vi /etc/sysconfig/network-scripts/ifcfg-ens33


#修改 ONBOOT=no  为 ONBOOT=yes

#重启网络服务

service network restart

#查看ip

ip addr



#可选项目

yum install -y wget lrzsz screen
