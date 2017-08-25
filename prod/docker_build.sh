#!/bin/bash

sudo docker build --tag mobile-web:latest .
sudo docker tag mobile-web:latest localhost:5000/mobile-web:latest
sudo docker push localhost:5000/mobile-web:latest
