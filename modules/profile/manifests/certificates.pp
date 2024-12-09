# Class: certificates
class profile::certificates {
  file { 'certificate':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => '/etc/pki/tls/certs/cert.pem',
    source => '/puppet_course/files/cert.pem',
  }
  file { 'chain':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => '/etc/pki/tls/certs/chain.pem',
    source => '/puppet_course/files/chain.pem',
  }
  file { 'fullchain':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => '/etc/pki/tls/certs/fullchain.pem',
    source => '/puppet_course/files/fullchain.pem',
  }
  file { 'privatekey':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => '/etc/pki/tls/private/privatekey.pem',
    source => '/puppet_course/files/privatekey.pem',
  }
}
