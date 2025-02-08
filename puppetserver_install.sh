#! /bin/bash

# Download the puppet yum repositories config packages
curl -O https://yum.puppet.com/puppet8-release-el-9.noarch.rpm
curl -O https://yum.puppet.com/puppet-tools-release-el-9.noarch.rpm

# Install the puppet apt repositories config packages
sudo dnf install puppet8-release-el-9.noarch.rpm && sudo dnf install puppet-tools-release-el-9.noarch.rpm

# Update the apt package list
sudo dnf update

# Install Puppetserver and other puppet tools
sudo dnf install -y puppet-bolt pdk
