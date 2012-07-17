class mumble::config {

  file{'/etc/mumble-server.ini':
    owner   => 'root',
    group   => 'root',
    replace => true,
    content => template('mumble/mumble-server.erb'),
  }

}
