#草稿，无法使用

cat /proc/cpuinfo

yum install -y wget git vim lrzsz screen net-tools telnet
yum update -y


wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh



mv ./data1/* /data1/


docker run --name my-nginx -d --network=host   -v /data1/conf/nginx:/etc/nginx:ro -v /data1/htdocs:/htdocs:ro  -v /data1/log/nginx:/logs nginx

docker run --name my-php -d --network=host -v /data1/htdocs:/htdocs:ro php:7.3-fpm

#移动配置文件
docker exec -t my-php bash -c "mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini"
#安装redis
docker exec -t my-php bash -c "yes '' |pecl install redis"
docker exec -t my-php bash -c "echo \"extension=redis.so\" >> /usr/local/etc/php/php.ini"

#安装gd
docker exec -t my-php bash -c "apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd"
#安装swoole
#docker exec -t my-php bash -c "yes '' |pecl install swoole"
#docker exec -t my-php bash -c "echo \"extension=swoole.so\" >> /usr/local/etc/php/php.ini"
#docker restart my-php
#安装pcntl
docker exec -t my-php bash -c "docker-php-source extract \
    && cd /usr/src/php/ext/pcntl \
    && 	phpize \
    && ./configure && make && make install \
    && echo "extension=pcntl.so" >> /usr/local/etc/php/php.ini \
    && docker-php-source delete"
    
#安装sockets
docker exec -t my-php bash -c "docker-php-source extract \
    && cd /usr/src/php/ext/sockets \
    && 	phpize \
    && ./configure && make && make install \
    && echo "extension=sockets.so" >> /usr/local/etc/php/php.ini \
    && docker-php-source delete"
    
#安装完扩展重启镜像
docker restart my-php


docker run --name my-mysql -d -p 3306:3306  -e MYSQL_ROOT_PASSWORD=weibo.com mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker run --name my-redis -d -p 6379:6379 -v /data1/data/redis:/data -v /data1/conf/redis.conf:/usr/local/etc/redis/redis.conf redis redis-server --appendonly yes 
#进入docker执行命令
#docker exec -i -t  mynginx /bin/bash
#docker安装常用命令
#apt-get update && apt-get install procps vim net-tools

#打开防火墙端口
firewall-cmd --zone=public --add-port=80/tcp --permanent  
firewall-cmd --zone=public --add-port=443/tcp --permanent  
firewall-cmd --reload





docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk

wget --no-check-certificate -O shadowsocks-libev.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
chmod +x shadowsocks-libev.sh
./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log

#libev版本需要内核版本>3.7 ,否则会出 ERROR: failed to set TCP_FASTOPEN_CONNECT
#docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev -v /data1/conf/ss:/etc/shadowsocks-libev teddysun/shadowsocks-libev
docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-go -v /data1/conf/ss:/etc/shadowsocks-go teddysun/shadowsocks-go



