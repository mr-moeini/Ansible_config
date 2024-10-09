#!/bin/bash

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$ID
else
    echo "Cannot determine the Linux distribution."
    exit 1
fi

# Perform actions based on the distribution
if [[ "$distro" == "ubuntu" ]]; then
    echo "This is Ubuntu. Performing install ansible"
    # Add your Ubuntu-specific commands here
    sudo apt-get update -y
    sudo apt-get install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
     sudo apt-get update
    sudo apt-get install ansible -y
elif [[ "$distro" == "rhel" || "$distro" == "centos" ]]; then
    echo "This is Red Hat or CentOS. Performing Redhat instalation"
    # Add your Red Hat/CentOS-specific commands here
    # Enable the EPEL repository for additional packages
    sudo yum install -y epel-release
    sudo yum update
    # Install Ansible
    sudo yum install -y ansible

    echo "Ansible installed successfully."
else
    echo "Unknown or unsupported Linux distribution: $distro"
    exit 1
fi
