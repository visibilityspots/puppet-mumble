# Installation of the mumble service by installing the mumble-server package
class mumble::install::rpm ($mumble_password, $mumble_port){

	# Installing the package mumble-server	
	package { 'mumble-server':
		ensure 	=> 'installed',
    require => Yumrepo['inuits'],
	}

	# Ordering manifest so the service will run after all files, packages, and service iptables have been created, changed or restarted
	Yumrepo['inuits'] -> Package['mumble-server'] -> File['/etc/mumble-server.ini'] -> Service['mumble-server']
}
