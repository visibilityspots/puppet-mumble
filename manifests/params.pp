# Class mumble::params
# This class contains every parameter which will be used in this puppet module
# for setting up a mumble voip server

class mumble::params {
  # Packages
  $package_name = 'mumble-server'
  # Configuration parameter
  $password = 'yourpassword'
  $port = '64738'
  $bandwidth = '6000'
}
