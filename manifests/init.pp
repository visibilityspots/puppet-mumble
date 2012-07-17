class mumble {

  include ::mumble::params
  include ::mumble::install
  include ::mumble::config
  include ::mumble::service
  include ::mumble::iptables

  Class['::mumble::params'] ->
  Class['::mumble::install'] ->
  Class['::mumble::config'] ->
  Class['::mumble::service'] ->
  Class['::mumble::iptables']

}
