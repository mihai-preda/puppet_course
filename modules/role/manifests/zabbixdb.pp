# zabbix db
class role::zabbixdb {
  include profile::monitor
  include profile::swap_file
}
