class mumble::params (
  $package_name = undef,
  $password     = undef,
  $port         = undef,
  $bandwidth    = undef,
) {
  $_package_name = $mumble::params::package_name ? {
    undef   => 'mumble-server',
    default => $mumble::params::package_name,
  }

  $_password = $mumble::params::password ? {
    undef   => 'letsmumble',
    default => $mumble::params::password,
  }

  $_port = $mumble::params::port ? {
    undef   => '64738',
    default => $mumble::params::port,
  }

  $_bandwidth = $mumble::params::bandwidth ? {
    undef   => '100000',
    default => $mumble::params::bandwidth,
  }
}
