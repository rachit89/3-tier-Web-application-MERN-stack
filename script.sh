#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
sudo snap install node --classic
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
sudo apt install -y awscli
aws ssm send-command --document-name "AmazonCloudWatch-ManageAgent" --document-version "8" --parameters '{"action":["configure"],"mode":["ec2"],"optionalConfigurationSource":["ssm"],"optionalConfigurationLocation":["AmazonCloudWatch-linux-rachit-nodejs"],"optionalOpenTelemetryCollectorConfigurationSource":["ssm"],"optionalOpenTelemetryCollectorConfigurationLocation":[""],"optionalRestart":["yes"]}' --timeout-seconds 600 --max-concurrency "50" --max-errors "0" --region us-east-2
