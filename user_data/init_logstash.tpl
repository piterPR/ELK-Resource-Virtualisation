#!/usr/bin/env bash

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade
sudo apt-get install openjdk-8-jre -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get update
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt-get update && sudo apt-get install logstash
sudo update-rc.d logstash defaults 97 8
sudo service logstash start

#Configure SSM for possibility to login to shell from aws console 

sudo snap switch --channel=candidate amazon-ssm-agent
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
sudo systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service

# Configure the logstash service

cat << EOF >/tmp/logstash.conf
input {
#for testing only
heartbeat {
    interval => 10
    type => "heartbeat"
    message => "epoch"
}
s3 {
    "bucket" => "logstach-backend-app"
    "region" => "us-east-1"
    "additional_settings" => {
    "force_path_style" => true
    "follow_redirects" => false
    }
}
}
output {
stdout {
codec => rubydebug
}
elasticsearch {
hosts => ["${elasticsearch_host}:9200"] # Use the internal IP of your Elasticsearch server
# for production
}



}
EOF

sudo mv /tmp/logstash.conf /etc/logstash/conf.d/10-syslog.conf
sudo service logstash restart