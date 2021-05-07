#!/bin/bash
yum install -y git
amazon-linux-extras install ansible2 -y
amazon-linux-extras install docker -y
cd /tmp
git clone https://github.com/pmkuny/demo-aws-env
cd /tmp/demo-aws-env/dev_instance/
ansible-galaxy collection install community.general
ansible-playbook -i hosts playbook.yml
