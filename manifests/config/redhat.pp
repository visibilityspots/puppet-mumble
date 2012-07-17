class mumble::config::redhat {
  case $mumble::params::_install_type {
    'source': {
      include mumble::config::redhat::source
    }
    'rpm': {
      include mumble::config::redhat::rpm
    }
    default: {
      fail('Wrong install type')
    }
  }
}
