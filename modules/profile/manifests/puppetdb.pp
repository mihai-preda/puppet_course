# profile puppetdb
class profile::puppetdb {
  class { 'puppetdb':
    postgresql_ssl_on       => true,
    database_host           => 'db.preda.ca',
    database_listen_address => '0.0.0.0',
    database_password       => 'ctm3muf7tze!PYN@pvj',
    node_ttl                => '0s',
    node_purge_ttl          => '0s',
  }
  firewalld_custom_service { 'puppetdb':
    require     => Class['puppetdb'],
    short       => 'puppetdb',
    description => 'Puppetdb http and https ports',
    ports       => [
      {
        'port'     => '8080',
        'protocol' => 'tcp',
      },
      {
        'port'     => '8081',
        'protocol' => 'tcp',
      },
    ],
  }
  exec { 'puppetdb-ssl-setup':
    command     => '/opt/puppetlabs/bin/puppetdb ssl-setup -f',
    path        => ['/bin','/usr/bin','/opt/puppetlabs/bin'],
    unless      => '/opt/puppetlabs/bin/puppetdb ssl-setup --check || test -f /etc/puppetlabs/puppetdb/ssl/ca.pem',
    require     => Class['puppetdb'],
    refreshonly => true,
  }
}
