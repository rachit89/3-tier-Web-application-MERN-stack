#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs
sudo npm install -g npm@latest
sudo npm install -g pm2@latest
git clone https://github.com/rachit89/node-express-realworld-example-app.git
cd node-express-realworld-example-app/
sudo npm install
sudo pm2 start app.js
sudo apt install collectd -y
sudo apt install awscli -y
sudo chown ubuntu:ubuntu -R /opt
mkdir /opt/softwares
sudo wget https://s3.us-east-2.amazonaws.com/amazoncloudwatch-agent-us-east-2/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
sudo snap install aws-cli --classic
