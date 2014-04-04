class haproxy::config {

  file { 'haproxy_config':
    path    => '/etc/haproxy/haproxy.cfg',
    content => template('haproxy/haproxy.cfg.erb'),
    mode    => '0644',
  }

}
