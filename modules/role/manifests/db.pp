# puppetdb role
class role::db {
  include profile::base
  include profile::puppet_agent
  require profile::monitor
}
