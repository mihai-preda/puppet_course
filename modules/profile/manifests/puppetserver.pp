# puppet server profile
class profile::puppetserver {
  # OpenVox builds: same service name, paths and binaries as puppetserver and
  # puppetdb-termini, but the packages do not Provide those names.
  package { 'openvox-server':
    ensure => 'installed',
  }
  file { 'sysconfig-puppetserver':
    ensure  => 'file',
    path    => '/etc/sysconfig/puppetserver',
    source  => '/puppet_course/files/sysconfig-puppetserver.txt',
    require => Package['openvox-server'],
  }
  service { 'puppetserver':
    ensure  => true,
    enable  => true,
    require => [Package['openvox-server'], File['sysconfig-puppetserver']],
  }
  package { 'openvoxdb-termini':
    ensure   => 'installed',
    provider => 'dnf',
  }
  # firewalld_service { 'Allow puppetmaster from the public zone':
  #   ensure  => 'present',
  #   service => 'puppetmaster',
  #   zone    => 'public',
  #   require => Service['puppetserver'],
  # }
  package { 'hiera-eyaml':
    ensure   => 'installed',
    provider => 'puppetserver_gem',
  }
  file { 'eyaml-dir':
    ensure => 'directory',
    path   => '/etc/puppetlabs/puppet/eyaml', # The keys dir will be created upon running the command eyaml createkeys
    owner  => puppet,
  }
  exec { 'eyaml create keys':
    command => '/opt/puppetlabs/puppet/lib/ruby/vendor_gems/bin/eyaml createkeys',
    cwd     => '/etc/puppetlabs/puppet/eyaml',
    path    => '/opt/puppetlabs/puppet/lib/ruby/vendor_gems/bin',
    creates => ['/etc/puppetlabs/puppet/eyaml/keys/private_key.pkcs7.pem', '/etc/puppetlabs/puppet/eyaml/keys/public_key.pkcs7.pem'],
  }
}
