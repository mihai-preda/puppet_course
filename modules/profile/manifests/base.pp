# base profile
class profile::base {
  exec { 'set local':
    command => '/bin/localectl set-locale LANG=en_GB',
  }
  exec { 'dnf update':
    command => '/bin/dnf update -y',
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
  user { 'mihai':
    ensure => 'present',
    groups => ['wheel'],
    shell  => '/bin/bash',
  }

  file { '/home/mihai':
    ensure => directory,
    owner  => 'mihai',
    group  => 'mihai',
  }

  file { '/home/mihai/.ssh':
    ensure => directory,
    owner  => mihai,
    group  => mihai,
    mode   => '0700',
  }

  ssh_authorized_key { 'mihai':
    ensure => present,
    user   => 'mihai',
    type   => 'ssh-ed25519',
    key    => 'AAAAC3NzaC1lZDI1NTE5AAAAIGLpIUJsD7eTM5znhRCSL5ls6hPZ6WsvWBSYV8AXv91K',
  }
  notify { 'hello from the puppet server':
  }
}
