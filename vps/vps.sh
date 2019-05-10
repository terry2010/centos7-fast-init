#草稿，无法使用

cat /proc/cpuinfo

yum install -y wget git vim lrzsz screen net-tools telnet
yum update -y

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh

wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh


 

docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk

wget --no-check-certificate -O shadowsocks-libev.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
chmod +x shadowsocks-libev.sh
./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log

#libev版本需要内核版本>3.7 ,否则会出 ERROR: failed to set TCP_FASTOPEN_CONNECT
#docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev -v /data1/conf/ss:/etc/shadowsocks-libev teddysun/shadowsocks-libev
docker run -d -p 9999:9999 -p 9999:9999/udp --name ss-go -v /data1/conf/ss:/etc/shadowsocks-go teddysun/shadowsocks-go



