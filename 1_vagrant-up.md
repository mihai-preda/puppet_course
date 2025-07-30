# The order in which this env should be built:
## Use bolt to bootstrap the agents
1) Build the Puppet Server vm first.
 - run bolt twice on puppet server
2) Build the Zabbix Server vm second.
 - make sure the certificates are uploaded to /etc/pki/tls/certs
3) Build the DB vm third.
 - make sure the PostgreSQL repo is created in /etc/yum.repos.d.
 - run bolt twice on Puppet DB
