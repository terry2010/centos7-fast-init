#草稿，无法使用

cat /proc/cpuinfo
cat /etc/redhat-release 

#禁止升级内核 serverspeed 只支持老版本内核 , lotServer 支持7.6/3.10.0-957
#echo "exclude=kernel*" >> /etc/yum.conf

yum install -y wget git vim lrzsz screen net-tools telnet iftop
yum update -y

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh
 
#安装 lotServer （锐速）
wget --no-check-certificate   https://github.com/MoeClub/lotServer/raw/master/Install.sh
bash  Install.sh install  3.10.0-957.el7.x86_64
 
 #查看状态
 bash /appex/bin/lotServer.sh status
 #加入系统自启动
 #好像不起作用？
 echo "sleep 1 && bash /appex/bin/lotServer.sh start" >> /etc/rc.local
 
#安装dropbox
#docker run -d --restart=always --name=dropbox -v /data1:/dbox/Dropbox/data1 janeczku/dropbox
docker run -d  --name=dropbox -v /data1:/dbox/Dropbox/data1 janeczku/dropbox

#查看dropbox 授权链接
docker logs -f dropbox 
docker exec -it dropbox /bin/bash

#如果没有在dropbox 备份过数据， 这一步替换为
git clone https://github.com/terry2010/centos7-fast-init.git
mv centos7-fast-init/vps/data1 /data1


#docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk
#docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data terry2010/chrome-headless-chinese

#wget --no-check-certificate -O shadowsocks-libev.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
#chmod +x shadowsocks-libev.sh
#./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log


mv ./data1 /
#libev版本需要内核版本>3.7 ,否则会出 ERROR: failed to set TCP_FASTOPEN_CONNECT

#docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev -v /data1/conf/ss:/etc/shadowsocks-libev teddysun/shadowsocks-libev
docker run -d -p 9999:9999 -p 9999:9999/udp --restart=always --name ss-go -v /data1/conf/ss:/etc/shadowsocks-go teddysun/shadowsocks-go

#打开防火墙端口
firewall-cmd --zone=public --add-port=9999/tcp --permanent  
firewall-cmd --zone=public --add-port=9999/udp --permanent  
firewall-cmd --reload

