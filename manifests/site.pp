# site
node 'db.preda.ca' { include role::db }
node default { include role::default }
node 'puppet.preda.ca' { include role::puppetserver }
node 'web.preda.ca' { include role::webserver }
node 'monit.preda.ca' { include role::zabbixserver }
node 'app-srv1.preda.ca' { include role::app }
