#!/bin/bash

component=$1
environment=$2
dnf install ansible -y
ansible-pull -U https://github.com/Deepthi-123456789/ansible-roboshop-roles-86-tf.git -e component=$component -e environment=$environment main.yaml