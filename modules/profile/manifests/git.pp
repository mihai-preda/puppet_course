# Class git
class profile::git {
  package { 'git':
    ensure => installed,
  }
# Resource git_webhook is provided by https://github.com/bjvrielink/abrader-gms/tree/fixup
# git_deploy_key { 'add_deploy_key_to_puppet_control':
#   ensure       => present,
#   name         => $facts['networking']['fqdn'],
#   path         => '/root/.ssh/id_dsa.pub',
#   token        => hiera('gitlab_api_token'),
#   project_name => 'puppet/control',
#   server_url   => 'http://your.internal.gitlab.server.com',
#   provider     => 'gitlab',
}
