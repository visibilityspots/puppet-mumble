class mumble::install {

  package{$::mumble::params::_package_name:
    ensure  => 'installed',
    require => $::operatingsystem ? {
      centos,redhat,fedora  => Yumrepo['inuits'],
      default               => undef,
    },
  }

}
