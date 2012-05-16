class mumble::iptables {
  include ::iptables
  iptables::rule{'mumble-server':
    dport => "${mumble::params::_port}",
  }
}
