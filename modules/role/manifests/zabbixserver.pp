# Zabbix Server
class role::zabbixserver {
  include profile::base
  include profile::puppet_agent
  include profile::monitor
  include profile::swap_file
}
