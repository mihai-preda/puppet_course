# profile puppetdb
class profile::puppetdb {
  class { 'puppetdb::globals':
    version => 'present',
  }

  class { 'puppetdb':
    postgresql_ssl_on       => false,
    # postgresql_ssl_key_path     => '/etc/puppetlabs/puppet/ssl/private_keys/db.preda.ca.pem',
    # postgresql_ssl_cert_path    => '/etc/puppetlabs/puppet/ssl/certs/db.preda.ca.pem',
    # postgresql_ssl_ca_cert_path => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    database_host           => 'db.preda.ca',
    database_listen_address => '0.0.0.0',
    database_password       => 'Tempopa$$31;',
    node_ttl                => '0s',
    node_purge_ttl          => '0s',
    manage_dbserver         => true,
    postgres_version        => '16',
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
  # exec { 'puppetdb-ssl-setup':
  #   command => '/opt/puppetlabs/bin/puppetdb ssl-setup -f',
  #   path    => ['/bin','/usr/bin','/opt/puppetlabs/bin'],
  #   unless  => 'test -f /etc/puppetlabs/puppetdb/ssl/ca.pem',
  #   require => Class['puppetdb'],
  # }
}
