class mumble::service {
  service{'mumble-server':
       hasstatus	=> true,
       enable			=> true,
       ensure			=> running,
       subscribe  => File['/etc/mumble-server.ini'],
  }  
}
