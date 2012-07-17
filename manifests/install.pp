class mumble::install {

  package{$::mumble::params::_package_name:
    ensure  => 'installed',
    require => Yumrepo['inuits'],
  }

}
