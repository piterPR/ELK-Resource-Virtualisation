# Project Resource Virtualisation and Distributed Computing 
## ELK 
ELK is an acronym used to describe a stack that consists of three popular projects: Elasticsearch, Logstash and Kibana. Often referred to as Elasticsearch, the ELK stack provides the ability to aggregate logs from all systems 
and applications, analyse these logs and create visualisations to monitor applications 
and infrastructure, faster troubleshooting or security analysis of selected applications or the entire infrastructure


## Create your own ELK using terraform
To create infrastructure on your own environment you have to create terraform.tfvars file and provide following variables: 

aws_access_key="xxxxx"

aws_secret_key="xxxxx"

aws_session_token="xxxxx"

aws_region="xxxxx"

## Create your own ELK using cloudshell and terraform
It is also possible to create your own ELK without AWS SECRET KEYS. You can clone repository directly into cloudshell and run code inside your cloud. 
