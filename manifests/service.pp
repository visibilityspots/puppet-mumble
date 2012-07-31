# Class: mumble::service
#
# Class which ensures the mumble services is running
class mumble::service {
  service{'mumble-server':
    hasstatus => true,
    enable    => true,
    ensure    => 'running',
    require   => File['/etc/mumble-server.ini'],
  }  
}
