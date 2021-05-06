#!/bin/bash
sudo yum -y install git
sudo amazon-linux-extras install ansible2 -y
cd /tmp
git clone https://github.com/pmkuny/scripts
cd scripts/dev_instance
ansible-playbook -i hosts playbook.yml
