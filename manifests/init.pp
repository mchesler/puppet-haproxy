class haproxy {

  include haproxy::install
  include haproxy::service

  class { 'ssh': prod_allowed_groups => ['developers'] }

  if $::environment != 'prod' {
    Class['haproxy::install'] -> Class['haproxy::config'] ~> Class['haproxy::service']
  } else {
    Class['haproxy::install'] -> Class['haproxy::config'] -> Class['haproxy::service']
  }

}
