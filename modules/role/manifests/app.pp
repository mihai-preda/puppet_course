# app server role
class role::app {
  include profile::base
  include profile::puppet_agent
  include profile::swap_file
}
