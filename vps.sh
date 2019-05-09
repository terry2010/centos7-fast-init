#草稿，无法使用

cat /proc/cpuinfo

yum install -y wget git vim lrzsz screen net-tools telnet


wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh

wget -N --no-check-certificate  https://github.com/terry2010/centos7-fast-init/raw/master/docker/install.sh && bash install.sh



mkdir -p /data1/htdocs/
mkdir -p /data1/logs/
mkdir -p /data1/conf/nginx/
mkdir -p /data1/conf/mysql/
mkdir -p /data1/data/mysql/



docker run --name my-nginx -d -p 80:80 -v /data1/htdocs:/usr/share/nginx/html:ro -v /data1/conf/nginx:/etc/nginx:ro nginx

docker run --name my-php -d -p 9020:9020 php:7.3-fpm
docker run --name my-mysql -d -p 3306:3306  -e MYSQL_ROOT_PASSWORD=weibo.com mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

#进入docker执行命令
#docker exec -i -t  mynginx /bin/bash

docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk
