class haproxy::rabbitmq_cju inherits haproxy {

  $listen_port = '5672'

  $backends => [
    {
      name    => 'rabbitmq_cju_1',
      address => 'rabbitmq-cju-1.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_2',
      address => 'rabbitmq-cju-2.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_3',
      address => 'rabbitmq-cju-3.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_4',
      address => 'rabbitmq-cju-4.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_5',
      address => 'rabbitmq-cju-5.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_6',
      address => 'rabbitmq-cju-6.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_7',
      address => 'rabbitmq-cju-7.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_8',
      address => 'rabbitmq-cju-8.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_9',
      address => 'rabbitmq-cju-9.idc.theladders.com:5672'
    },
    {
      name    => 'rabbitmq_cju_10',
      address => 'rabbitmq-cju-10.idc.theladders.com:5672'
    },
  ]

  class { 'iptables': tcp_ports => ['9090', $listen_port] }

  class { 'haproxy::config':
  }
}
