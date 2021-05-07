#!/bin/bash
sudo yum -y install git
sudo amazon-linux-extras install ansible2 -y
cd /tmp
git clone https://github.com/pmkuny/demo-aws-env
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
cd dev_instance
ansible-galaxy collection install community.general
ansible-playbook -i hosts playbook.yml
