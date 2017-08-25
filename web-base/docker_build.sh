#!/bin/bash

sudo docker build --tag web-base:latest .
sudo docker tag web-base:latest localhost:5000/web-base:latest
sudo docker push localhost:5000/web-base:latest
