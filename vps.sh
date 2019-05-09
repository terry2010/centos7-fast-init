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
docker run --name my-nginx -d -p 80:80 --net host -v /data1/htdocs:/usr/share/nginx/html:ro -v /data1/conf/nginx:/etc/nginx:ro nginx

