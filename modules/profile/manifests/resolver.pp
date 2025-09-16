# resolver profile
class profile::resolver {
  class { 'resolver':
    method    => 'sysconfig',
    servers   => ['10.21.2.254'],
    domains   => ['preda.ca'],
    interface => 'eth1',
  }
}
