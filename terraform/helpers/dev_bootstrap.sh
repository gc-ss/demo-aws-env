#!/bin/bash
sudo yum -y install git
sudo amazon-linux-extras install ansible2 -y
cd /tmp
git clone https://github.com/pmkuny/demo-aws-env
cd dev_instance
ansible-galaxy collections install community.general
ansible-playbook -i hosts playbook.yml
