# role for physical servers
class role::physical {
  include profile::base
  include profile::puppet_agent
  include profile::certificates
}
