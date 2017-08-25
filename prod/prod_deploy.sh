#!/bin/bash

# tomcat-base 이미지 pull
sudo docker pull localhost:5000/mobile-web:latest

# 기존 컨테이너 중지
sudo docker stop web

# 기존 컨테이너 삭제
sudo docker rm web

# 신규 컨테이너 구동
sudo docker run -i -t --name web -d -p 80:80 -p 443:443 localhost:5000/mobile-web:latest

# 톰캣 구동
sleep 10
sudo docker exec web /usr/local/server/tomcat/bin/catalina.sh start

# 아파치 구동
sleep 5
sudo docker exec web /usr/local/server/apache/bin/apachectl start

