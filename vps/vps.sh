#草稿，无法使用

cat /proc/cpuinfo
cat /etc/redhat-release 

#禁止升级内核 serverspeed 只支持老版本内核 , lotServer 支持7.6/3.10.0-957
#echo "exclude=kernel*" >> /etc/yum.conf

yum install -y wget git vim lrzsz screen net-tools telnet iftop
yum update -y

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh
 
#安装 lotServer （锐速）
 bash <(wget --no-check-certificate -qO- https://github.com/MoeClub/lotServer/raw/master/Install.sh) install 3.10.0-957.el7.x86_64
 
 #查看状态
 bash /appex/bin/lotServer.sh status
 #加入系统自启动
 #好像不起作用？
 echo "bash /appex/bin/lotServer.sh start" >> /etc/rc.local
 
 

#docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk

#wget --no-check-certificate -O shadowsocks-libev.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
#chmod +x shadowsocks-libev.sh
#./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log


mv ./data1 /
#libev版本需要内核版本>3.7 ,否则会出 ERROR: failed to set TCP_FASTOPEN_CONNECT
#docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev -v /data1/conf/ss:/etc/shadowsocks-libev teddysun/shadowsocks-libev
docker run -d -p 9999:9999 -p 9999:9999/udp --restart=always --name ss-go -v /data1/conf/ss:/etc/shadowsocks-go teddysun/shadowsocks-go



