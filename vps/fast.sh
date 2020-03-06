
cat /proc/cpuinfo
cat /etc/redhat-release 

echo "exclude=kernel*" >> /etc/yum.conf

yum update -y
yum install -y wget git vim lrzsz screen net-tools telnet iftop
yum install -y epel-release 
git clone https://github.com/terry2010/centos7-fast-init.git 
cd centos7-fast-init/vps/


wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh
 


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

