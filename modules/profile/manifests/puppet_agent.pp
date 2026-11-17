# class puppet agent
# Installs the OpenVox agent (the community build that replaces Perforce's
# puppet-agent) from yum.voxpupuli.org. Paths, binaries and the 'puppet'
# service name are the same as with puppet-agent.
# @param puppet_server - the puppt master to point the agent to
# @param run_interval - the time interval at which the puppet agent should run
# @param environment - the code environment
# @param agent_version - the agent version to be installed
# @param release - the OpenVox major release whose repo is configured
class profile::puppet_agent (
  String  $puppet_server = 'puppet.preda.ca',
  String  $run_interval  = '1h',
  String  $environment   = 'production',
  String  $agent_version = 'latest',
  Integer $release       = 8,
) {
  # RPM-only. The Windows OpenVox agent is installed from its MSI at build
  # time (see the control-repo's profile::openvox_agent).
  if $facts['os']['family'] == 'windows' {
    return()
  }
  $puppet_conf = '/etc/puppetlabs/puppet/puppet.conf'

  package { "openvox${release}-release":
    ensure   => 'installed',
    provider => 'rpm',
    source   => "https://yum.voxpupuli.org/openvox${release}-release-el-${facts['os']['release']['major']}.noarch.rpm",
  }
  package { 'openvox-agent':
    ensure  => $agent_version,
    require => Package["openvox${release}-release"],
  }
  ini_setting { 'puppet-main-server':
    ensure  => 'present',
    path    => $puppet_conf,
    section => 'main',
    setting => 'server',
    value   => $puppet_server,
    require => Package['openvox-agent'],
  }
  ini_setting { 'puppet-main-runinterval':
    ensure  => 'present',
    path    => $puppet_conf,
    section => 'main',
    setting => 'runinterval',
    value   => $run_interval,
    require => Package['openvox-agent'],
  }
  service { 'puppet':
    ensure  => 'running',
    enable  => true,
    require => [Ini_setting['puppet-main-server'], Ini_setting['puppet-main-runinterval']],
  }
}
