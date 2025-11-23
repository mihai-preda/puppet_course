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
  package { 'hiera-eyaml':
    ensure   => 'installed',
    provider => 'puppetserver_gem',
  }
  file { 'eyaml-dir':
    ensure   => 'directory',
    path     => '/etc/puppetlabs/puppet/eyaml/keys',
    owner    => puppet,
    provider => posix,
  }
  exec { 'pkcs':
    command => '/opt/puppetlabs/bin/hiera createkeys',
    cwd     => '/etc/puppetlabs/puppet/eyaml/keys',
    path    => '/opt/puppetlabs/bin/hiera',
    creates => ['/etc/puppetlabs/puppet/eyaml/keys/private_key.pkcs7.pem', '/etc/puppetlabs/puppet/eyaml/keys/public_key.pkcs7.pem'],
  }
}
