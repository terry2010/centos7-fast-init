#草稿，无法使用

cat /proc/cpuinfo
cat /etc/redhat-release 

#禁止升级内核 serverspeed 只支持老版本内核
echo "exclude=kernel*" >> /etc/yum.conf

yum install -y wget git vim lrzsz screen net-tools telnet
yum update -y

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh
 
wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash -c "yes '1'|sh serverspeeder.sh"
#centos 7.2 强安
#wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder-v.sh && bash serverspeeder-v.sh CentOS 7.2 3.10.0-327.el7.x86_64 x64 3.11.20.5 serverspeeder_72327
 
 
 
 

#docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk

#wget --no-check-certificate -O shadowsocks-libev.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
#chmod +x shadowsocks-libev.sh
#./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log


mv ./data1 /
#libev版本需要内核版本>3.7 ,否则会出 ERROR: failed to set TCP_FASTOPEN_CONNECT
#docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev -v /data1/conf/ss:/etc/shadowsocks-libev teddysun/shadowsocks-libev
docker run -d -p 9999:9999 -p 9999:9999/udp --restart=always --name ss-go -v /data1/conf/ss:/etc/shadowsocks-go teddysun/shadowsocks-go



