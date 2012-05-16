class mumble::service {
  file { '/etc/mumble-server.ini':
    owner   => 'root',
    group   => 'root',
    replace => true,
    content => template('mumble/mumble-server.erb'),
  }

  service{'mumble-server':
       hasstatus => true,
       enable    => true,
       ensure    => running,
       require   => File['/etc/mumble-server.ini'],
  }  
}
