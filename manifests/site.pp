# site
node 'db.preda.ca' { include role::db }
node default { include role::default }
node 'puppet.preda.ca' { include role::puppetserver }
node 'web.preda.ca' { include role::webserver }
node 'monitor.preda.ca' { include role::zabbixserver }
node 'zdb.preda.ca' { include role::zabbixdb }
node 'app-srv1.preda.ca' { include role::app }
