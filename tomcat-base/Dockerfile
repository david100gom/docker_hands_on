#FROM web-base:latest
FROM localhost:5000/web-base:latest
MAINTAINER david100gom <david100gom@gmail.com>

# 웹루트 폴터 생성
RUN mkdir -p /home/web/WebContent/
RUN mkdir -p /usr/local/server/apache/htdocs/

# 설정파일 추가
ADD new_env.tar.gz /usr/local/src/
WORKDIR /usr/local/src/new_env/

RUN cp -R apache /usr/local/server/
RUN cp -R apache-tomcat-8.5.20 /usr/local/server/


