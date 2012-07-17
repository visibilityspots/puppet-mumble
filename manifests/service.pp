class mumble::service {

  service{'mumble-server':
    hasstatus => true,
    enable    => true,
    ensure    => 'running',
    require   => File['/etc/mumble-server.ini'],
  }  

}
