# Zabbix Server manifest
class profile::monitor {
  # Define the PostgreSQL Yum repository
  file { '/etc/yum.repos.d/pgdg.repo':
    ensure  => file,
    content => "[pgdg14]
name=PostgreSQL 14 for RHEL/CentOS 9 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/14/redhat/rhel-9-x86_64
enabled=1
gpgcheck=1
gpgkey=https://download.postgresql.org/pub/repos/yum/keys/PGDG-RPM-GPG-KEY-RHEL",
  }

  # Install PostgreSQL client version 14
  package { 'postgresql14':
    ensure  => installed,
    require => File['/etc/yum.repos.d/pgdg.repo'],
  }
}
