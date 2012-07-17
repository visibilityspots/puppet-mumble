class mumble::iptables {

  if ! defined(Class['::iptables']) {
    include ::iptables
  }

  iptables::rule{'mumble-server-tcp':
    dport => $::mumble::params::_port,
    proto => 'tcp',
  }

  iptables::rule{'mumble-server-udp':
    dport => $::mumble::params::_port,
    proto => 'udp',
  }

}
