class mumble {
  include mumble::params
  include mumble::iptables
  include mumble::install
  include mumble::config
  include mumble::service

  Class['mumble::params'] ->
  Class['mumble::iptables'] ->
  Class['mumble::install'] ->
  Class['mumble::config'] ->
  Class['mumble::service']
}
