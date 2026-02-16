# base profile
class profile::base {
  exec { 'dnf update':
    command => '/bin/dnf update -y',
    unless  => '/bin/dnf check-update 2>&1 | /bin/grep -q "Last metadata expiration check"',
  }
  exec { 'timedatectl':
    command => '/bin/timedatectl set-timezone America/Vancouver',
    unless  => '/bin/timedatectl show -p Timezone --value | /bin/grep -q "America/Vancouver"',
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
