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
  class { 'firewalld': }
  firewalld_service { 'Allow SSH from the public zone':
    services => [
      {
        'service'  => 'ssh',
        'protocol' => 'tcp',
        'action'   => 'accept',
      },
      {
        'service'  => 'puppetserver',
        'protocol' => 'tcp',
        'action'   => 'accept',
      },
    ],
  }
}
