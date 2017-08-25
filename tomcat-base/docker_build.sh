#!/bin/bash

sudo docker build --tag tomcat-base:prod-latest .
sudo docker tag tomcat-base:prod-latest localhost:5000/tomcat-base:prod-latest
sudo docker push localhost:5000/tomcat-base:prod-latest
