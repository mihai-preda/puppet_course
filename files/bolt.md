# Instructions
# Use Bolt for initial Puppet Server config, then switch to master->agent setup for the rest
# make sure puppet_agent version is 8.x
Run the following commands to get bolt going:
cat bolt-ssh-key.pub >> ~/.ssh/authorized_keys
echo "export BOLT_PROJECT='/puppet_course'" >> /root/.bashrc
exec bash
# **Important Note: projects created with one version of bolt will not run properly if executed with another version of bolt**
# set puppet server on nodes
puppet config set server puppet.preda.ca
# after successful deployment of puppet server, use control-repo with agents instead of bolt
# puppet.db
see /etc/puppetlabs/puppetdb/conf.d/jetty.ini
puppetdb ssl-setup -f