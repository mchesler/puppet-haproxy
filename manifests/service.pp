class haproxy::service {

  service { 'haproxy':
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
  }

}
