class mumble::params (
  $install_type = undef,
  $password     = undef,
  $port         = undef,
) {
  $_install_type = $mumble::params::install_type ? {
    undef   => 'rpm',
    default => ${mumble::params::install_type},
  }

  $_password = $mumble::params::password ? {
    undef   => 'letsmumble',
    default => $mumble::params::password,
  }

  $_port = $mumble::params::port ? {
    undef   => '64738',
    default => $mumble::params::port,
  }
}
