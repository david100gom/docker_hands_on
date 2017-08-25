FROM centos:centos7
MAINTAINER david100gom <david100gom@gmail.com>

RUN yum clean all
RUN yum -y install libjpeg-devel libpng-devel freetype-devel gd-devel gcc make gcc-c++ openssl-devel perl wget
RUN yum -y update openssl
RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src
RUN wget http://apache.mirror.cdnetworks.com/httpd/httpd-2.2.34.tar.gz
RUN wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz"
RUN wget https://www.openssl.org/source/openssl-1.0.2k.tar.gz
RUN wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-connectors/native/1.2.12/source/tomcat-native-1.2.12-src.tar.gz
RUN wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz
RUN tar -xvzf httpd-2.2.34.tar.gz
RUN tar -xvzf apache-tomcat-8.5.20.tar.gz
RUN tar -xvzf httpd-2.2.34.tar.gz
RUN tar -xvzf jdk-8u131-linux-x64.tar.gz
RUN tar -xvzf openssl-1.0.2k.tar.gz
RUN tar -xvzf tomcat-native-1.2.12-src.tar.gz
RUN tar -xvzf tomcat-connectors-1.2.42-src.tar.gz

# Apache setting
WORKDIR /usr/local/src/httpd-2.2.34
RUN ./configure --prefix=/usr/local/server/apache --with-mpm=worker --enable-mods-shared=all --enable-so --enable-rewrite --enable-proxy --enable-proxy-http --enable-ssl --enable-module=ssl
RUN make
RUN make install

# Apache 권한
WORKDIR /usr/local/server/apache/bin/
RUN chmod 755 -R /usr/local/server/apache/
RUN useradd -ms /bin/bash ec2-user
RUN chown root:root httpd
RUN chmod +s httpd
RUN chown ec2-user:ec2-user apachectl

# Java setting
WORKDIR /usr/local/src/
RUN cp -R jdk1.8.0_131 /usr/local/
WORKDIR /usr/local/
RUN ln -s jdk1.8.0_131 java

# Tomcat setting
WORKDIR /usr/local/src/
RUN cp -R apache-tomcat-8.5.20 /usr/local/server/
WORKDIR /usr/local/server/
RUN ln -s apache-tomcat-8.5.20 tomcat

# ENV setting
ENV JAVA_HOME /usr/local/java
ENV APACHE_HOME /usr/local/server/apache
ENV CATALINA_HOME /usr/local/server/tomcat
ENV CLASSPATH $JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$APACHE_HOME/bin

# Openssl update (for Tomcat Native library 설치)
WORKDIR /usr/local/src/openssl-1.0.2k/
RUN ./config --prefix=/usr --openssldir=/usr/local/openssl shared
RUN make
RUN make install

# Tomcat Native library 설치
WORKDIR /usr/local/src/tomcat-native-1.2.12-src/native/
RUN ./configure --with-apr=/usr/local/server/apache/bin/apr-1-config --with-java-home=$JAVA_HOME
RUN make
RUN make install
ENV LD_LIBRARY_PATH /usr/local/apr/lib

# Apache + Tomcat 연동작업
WORKDIR /usr/local/src/tomcat-connectors-1.2.42-src/native/
RUN ./configure --with-apxs=/usr/local/server/apache/bin/apxs
RUN make
RUN make install

# Tomcat 설치 폴더 소유권 변경
WORKDIR /usr/local/server/
RUN chown -R  ec2-user:ec2-user apache-tomcat-8.5.20
