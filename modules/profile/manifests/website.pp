# website profile
class profile::website {
  # resources
  class { 'apache':
    default_vhost => false,
  }
  apache::vhost { 'vhost.example.com':
    port    => 80,
    docroot => '/var/www/vhost',
  }

  file { '/var/www/vhost/index.html':
    content => 'Hello World',
  }
}
