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
  firewalld_custom_service { 'puppet':
    short                => 'puppet',
    description          => 'Puppet Client access Puppet Server',
    ports                => [
      {
        'port'     => '8140',
        'protocol' => 'tcp',
      },
      {
        'port'     => '8140',
        'protocol' => 'udp',
      },
    ],
    module               => ['nf_conntrack_netbios_ns',
      'ipv4_destination' => '127.0.0.1',
    'ipv6_destination'   => '::1'],
  }
}
