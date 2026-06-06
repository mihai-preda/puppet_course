# Class r10k
class profile::r10k {
  class { 'r10k':
    cachedir => '/var/cache/r10k',
    sources  => {
      'control-repo' => {
        'remote'                 => 'https://github.com/mihai-preda/control-repo',
        'basedir'                => '/etc/puppetlabs/code/environments',
        'ignore_branch_prefixes' => ['claude-'],
      },
    },
  }
  package { 'git':
    ensure => installed,
  }
}
