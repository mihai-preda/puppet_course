# zabbix db
class role::zabbixdb {
  include profile::base
  include profile::puppet_agent
  include profile::swap_file
}
