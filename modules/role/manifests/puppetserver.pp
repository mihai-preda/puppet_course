# puppt server class
class role::puppetserver {
  include profile::base
  include profile::puppet_agent
  #include profile::git
  include profile::puppetserver
  include profile::r10k
}
