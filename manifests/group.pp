class mumble::group {

  group{'mumble-server':
    ensure => 'present',
    gid    => '4000',
  }

}
