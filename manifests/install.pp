class haproxy::install {

  package { 'haproxy':
    ensure => installed,
  }

  # The sysctl module uses augeas to splice stuff into conf files
  sysctl::conf {
    # Minimize swappiness
    "vm.swappiness": value => 0;
    # Increase default send/receive buffers to 8MB
    "net.core.rmem_default": value => 8388608;
    "net.core.wmem_default": value => 8388608;
    # Increase max send/receive buffers to 128MB
    "net.core.rmem_max": value => 134217728;
    "net.core.wmem_max": value => 134217728;
    # Increase TCP send/receive buffers
    "net.ipv4.tcp_mem": value => '134217728 134217728 134217728';
    "net.ipv4.tcp_rmem": value => '4096 277750 134217728';
    "net.ipv4.tcp_wmem": value => '4096 277750 134217728';
    # Increase the length of the processor input queue
    "net.core.netdev_max_backlog": value => 300000;
    # Increase number of incomign connections
    "net.core.somaxconn": value => 40000;
    # Increase the number of outstanding syn requests allowed
    "net.ipv4.tcp_max_syn_backlog": value => 40000;
    # Decrease the time TCP FIN-WAIT-2 sockets are allowed to stick around
    "net.ipv4.tcp_fin_timeout": value => 15;
    # Allow TIME-WAIT sockets to be reused for new connections
    "net.ipv4.tcp_tw_reuse": value => 1;
    # Allow TIME-WAIT sockets to be recycled
    "net.ipv4.tcp_tw_recycle": value => 1;
    # Enable Selective Acknowledgements
    "net.ipv4.tcp_sack": value => 1;
    # Enable large TCP window scaling
    "net.ipv4.tcp_window_scaling": value => 1;
    # Increase frequency of TCP Keepalive probes
    "net.ipv4.tcp_keepalive_intvl": value => 30;
    # Dynamically adjust receive buffer size
    "net.ipv4.tcp_moderate_rcvbuf": value => 1;
  }

  file { 'haproxy_config':
    path    => '/etc/haproxy/haproxy.cfg',
    content => template('haproxy/haproxy.cfg.erb'),
    mode    => '0644',
  }

}
