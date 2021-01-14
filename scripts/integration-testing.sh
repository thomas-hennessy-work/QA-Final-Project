#!/bin/bash
sudo -H ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
cd ansible/e2e-ansible
ansible-playbook -v -i inventory playbook.yaml