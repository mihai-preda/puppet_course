# puppt server class
class role::puppetserver {
  include profile::base
  include profile::puppet_agent
  include profile::puppetserver
  include profile::r10k
  include profile::swap_file
}
