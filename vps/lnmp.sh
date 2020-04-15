#草稿，无法使用

cat /proc/cpuinfo

yum install -y wget git vim lrzsz screen net-tools telnet
yum update -y

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh

 

mv ./data1 /


docker run --name my-nginx -d --restart=always --network=host   -v /data1/conf/nginx:/etc/nginx:ro -v /data1/htdocs:/htdocs:ro  -v /data1/log/nginx:/logs nginx

docker run --name my-php -d --restart=always --network=host -v /data1/htdocs:/htdocs:ro php:7.3-fpm

#移动配置文件
docker exec -t my-php bash -c "mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini"
#安装redis
docker exec -t my-php bash -c "yes '' |pecl install redis"
docker exec -t my-php bash -c "echo \"extension=redis.so\" >> /usr/local/etc/php/php.ini"

#安装yaf
#docker exec -t my-php bash -c "yes '' |pecl install yaf"
#docker exec -t my-php bash -c "echo \"extension=yaf.so\" >> /usr/local/etc/php/php.ini"

#安装gd
docker exec -t my-php bash -c "apt-get update -y \
        &&apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql"
#安装swoole
#docker exec -t my-php bash -c "yes '' |pecl install swoole pdo_mysql"
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
#解决php无法写文件的问题
#只有当php容器挂载目录为可写的时候才需要这么做
#docker exec -t my-php bash -c "chown -R www-data:www-data /htdocs/"


#docker run --name my-mysql -d --network=host -v /data1/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=weibo.com mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
#docker run --name my-redis -d -p 6379:6379 -v /data1/data/redis:/data -v /data1/conf/redis:/usr/local/etc/redis redis redis-server --appendonly yes 
#进入docker执行命令
#docker exec -i -t  mynginx /bin/bash
#docker安装常用命令
#apt-get update && apt-get install procps vim net-tools

#打开防火墙端口
firewall-cmd --zone=public --add-port=80/tcp --permanent  
firewall-cmd --zone=public --add-port=443/tcp --permanent  
firewall-cmd --reload



 
