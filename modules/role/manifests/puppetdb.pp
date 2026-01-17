# puppetdb role
class role::puppetdb {
  include profile::base
  include profile::puppet_agent
  include profile::monitor
}
