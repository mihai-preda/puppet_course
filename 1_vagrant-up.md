# The order in which this env should be built

## Use bolt to bootstrap the agents

1) Build the Puppet Server vm first.
2) Add a Puppet module using bolt. Delete an existing module before to avoid errors.
3) Run bolt twice on puppet server
4) Build the Zabbix Server vm second.
5) make sure the certificates are uploaded to /etc/pki/tls/certs
6) Build the DB vm third.

- make sure the PostgreSQL repo is created in /etc/yum.repos.d.
- run bolt twice on Puppet DB
