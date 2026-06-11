#!/bin/bash

# Update packages
yum update -y

# Install Git
yum install git -y

# Add Jenkins Repository
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

# Import Jenkins Key
rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

# Install Java
yum install java-21-amazon-corretto -y

#Install terraform 
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#Install Kubectl 
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.3/2026-04-08/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
kubectl version --client

# Install Jenkins
yum install jenkins -y

# Start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Verify
systemctl status jenkins