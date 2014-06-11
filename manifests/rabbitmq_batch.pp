class haproxy::rabbitmq_batch inherits haproxy {

  $listen_port = '5672'

  $backends = [
    {
      name    => 'rabbitmq_batch_1',
      address => 'rabbitmq-batch-1.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_batch_2',
      address => 'rabbitmq-batch-2.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_batch_3',
      address => 'rabbitmq-batch-3.idc.theladders.com:5672'
    },
  ]

  class { 'iptables': tcp_ports => ['9090', $listen_port] }

  class { 'haproxy::config':
  }
}
