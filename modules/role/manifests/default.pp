# default role
class role::default {
  include profile::base
  include firewalld
  include accounts
  include profile::swap_file
}
