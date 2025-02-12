# Zabbix Server manifest
class profile::zabbixserver {
  class { 'zabbixserver': }
  class { 'zabbix::repo':
    zabbix_version => '7.0',
    manage_repo    => true,
  }
}
