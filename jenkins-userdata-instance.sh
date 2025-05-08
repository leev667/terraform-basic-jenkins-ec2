#!/bin/bash
sudo dnf update -y
sudo dnf install vim -y
sudo dnf install java-17-amazon-corretto -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo dnf install -y jenkins --nogpgcheck
sudo systemctl start jenkins
sudo systemctl enable jenkins
