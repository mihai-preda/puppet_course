# web server role
class role::webserver {
  include profile::base
  include profile::puppet_agent
  include profile::certificates
}
