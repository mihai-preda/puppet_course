# puppet server profile
class profile::puppetserver {
  package { 'puppetserver':
    ensure => 'installed',
  }
  file { 'sysconfig-puppetserver':
    ensure  => 'file',
    path    => '/etc/sysconfig/puppetserver',
    source  => '/puppet_course/files/sysconfig-puppetserver',
    require => Package['puppetserver'],
  }
  service { 'puppetserver':
    ensure  => true,
    enable  => true,
    require => [Package['puppetserver'], File['sysconfig-puppetserver']],
  }
  package { 'puppetdb-termini':
    ensure   => 'installed',
    provider => 'dnf',
  }
  firewalld_service { 'Allow multiple services from the public zone':
    ensure  => 'present',
    service => ['ssh', 'puppet', 'puppetserver'],
    zone    => 'public',
  }
}
