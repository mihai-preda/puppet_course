# certificates profile
class profile::certificates {
  $ssl_dir = '/etc/pki/tls'
  $ssl_files = '/puppet_course/files/'
  file { 'certificate':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => "${ssl_dir}/certs/${facts['networking']['fqdn']}-cert.pem",
    source => "${ssl_files}cert.pem",
  }
  file { 'chain':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => "${ssl_dir}/certs/${facts['networking']['fqdn']}-chain.pem",
    source => "${ssl_files}/chain.pem" ,
  }
  file { 'privatekey':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    path   => "${ssl_dir}/private/${facts['networking']['fqdn']}-key.pem",
    source => "${ssl_files}/privatekey.pem",
  }
}
