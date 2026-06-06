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

# Install Jenkins
yum install jenkins -y

# Start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Verify
systemctl status jenkins