# base profile
class profile::base {
  exec { 'dnf update':
    command => '/bin/dnf update -y',
  }
  exec { 'timedatectl':
    command => '/bin/timedatectl set-timezone America/Vancouver',
  }
  package { 'vim':
    ensure => 'present',
  }
  package { 'bash-completion':
    ensure => 'present',
  }
  package { 'telnet':
    ensure => 'present',
  }
  package { 'bind-utils':
    ensure => 'present',
  }
  package { 'net-tools':
    ensure => 'present',
  }
  notify { 'hello from the puppet server':
  }
}
