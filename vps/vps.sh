#草稿，无法使用

cat /proc/cpuinfo

yum install -y wget git vim lrzsz screen net-tools telnet
yum update -y


wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh



mv ./data1/* /data1/


docker run --name my-nginx -d -p 80:80 -v /data1/htdocs:/usr/share/nginx/html:ro -v /data1/conf/nginx:/etc/nginx:ro nginx

docker run --name my-php -d -p 9020:9020 php:7.3-fpm
docker run --name my-mysql -d -p 3306:3306  -e MYSQL_ROOT_PASSWORD=weibo.com mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker run --name my-redis -d -p 6379:6379 -v /data1/data/redis:/data -v /data1/conf/redis.conf:/usr/local/etc/redis/redis.conf redis redis-server --appendonly yes 
#进入docker执行命令
#docker exec -i -t  mynginx /bin/bash

docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk

wget --no-check-certificate -O shadowsocks-libev.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
chmod +x shadowsocks-libev.sh
./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log


docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev -v /data1/conf/ss:/etc/shadowsocks-libev teddysun/shadowsocks-libev


