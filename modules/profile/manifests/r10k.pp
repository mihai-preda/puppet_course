# Class r10k
class profile::r10k {
  class { 'r10k':
    remote => 'https://github.com/mihai-preda/control-repo',
  }
  package { 'git':
    ensure => installed,
  }
}
