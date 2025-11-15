# class puppet agent
class profile::puppet_agent {
  class { 'puppet_agent':
    package_version => $facts['puppetversion'],
    install_options => ['ENABLE_LONG_PATHS=true', 'PUPPET_SERVER=puppet.preda.ca', 'REINSTALLMODE="amus"'],
    config          => [{ section => main, setting => runinterval, value => '1h' }],
  }
}
