# Instructions

## Use Bolt for initial Puppet Server config, then switch to master->agent setup for the rest

## make sure puppet_agent version is 8.x

Copy your ssh key to the .ssh/authorized_keys of each server's vagrant user.
Do not use ruby-ssh, which is bolt's built-in ssh library.
Use native-ssh from Windows or other OS, and OP will prompt you for the private key to connect when Bolt runs.

## (only needed when running bolt from puppetserver) echo "export BOLT_PROJECT='/puppet_course'" >> /root/.bashrc

exec bash

## **Important Note: when starting from scratch with new .modules directory, use bolt to add a basic module like vcsrepo or stlib**

## set puppet server on nodes

puppet config set server puppet.preda.ca

## after successful deployment of puppet server, use control-repo with agents instead of bolt

## puppet.db

see /etc/puppetlabs/puppetdb/conf.d/jetty.ini
puppetdb ssl-setup -f
