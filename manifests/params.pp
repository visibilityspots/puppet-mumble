class mumble::params (
  $install_type = undef,
) {
  $_install_type = $mumble::params::install_type ? {
    undef   => 'rpm',
    default => ${mumble::params::install_type},
  }
}
