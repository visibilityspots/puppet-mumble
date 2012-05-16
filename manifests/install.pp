class mumble::install {
  case $mumble::params::install_type {
    'source': {
      include mumble::install::source
    }
    'rpm': {
      include mumble::install::rpm
    }
    default: {
      fail('Wrong install type')
    }
  }
}
