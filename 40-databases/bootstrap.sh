#!/bin/bash

component=$1
environment=$2
dnf install ansible -y
ansible-pull -U https://github.com/daws-86s/ansible-roboshop-roles-tf.git -e component=$component -e environment=$environment main.yaml