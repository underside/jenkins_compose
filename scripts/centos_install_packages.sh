#!/usr/bin/bash
# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
# sudo yum makecache
sudo yum install -y git
sudo yum install -y curl
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
