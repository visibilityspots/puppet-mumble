
# Installation of the mumble service by creating the necessary files manualy
class mumble-server::manual ($mumble_password, $mumble_port) {
	# Importing directory's for creating groups and users
	import 'groups/*.pp' 
	import 'users/*.pp'

	# Include mumble-server user and group
	include mumble-server_group
	include mumble-server_user 

	# Importing files for mumble service
	file { "/usr/sbin/murmurd":
		owner 	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/mumble-server/murmur.x86",
	}	

	file { "/etc/rc.d/init.d/mumble-server":
		owner 	=> "root",
		group	=> "root",
		mode	=> "0755",
		source	=> "puppet:///modules/mumble-server/mumble-server",	
	}

	# Creating mumble-server directories
	file { "/var/lib/mumble-server":
		ensure	=> "directory",
		owner 	=> "mumble-server",
		group	=> "mumble-server",
	}

	file { "/var/log/mumble-server":
		ensure	=> "directory",
		owner 	=> "mumble-server",
		group	=> "mumble-server",
	}

	# Ordering manifest so the service will run after all files, users, groups and iptables have been created or changed
	Group['mumble-server'] -> User['mumble-server'] -> File['/usr/sbin/murmurd'] -> File['/etc/mumble-server.ini'] -> File['/etc/rc.d/init.d/mumble-server'] -> File['/var/lib/mumble-server'] -> File['/var/log/mumble-server'] -> Service['mumble-server']
}


# Installation of the mumble service by installing the mumble-server package
class mumble-server::rpm ($mumble_password, $mumble_port){

	# Installing the package mumble-server	
	package { "mumble-server":
		ensure 	=> "installed",
    require => Yumrepo['inuits'],
	}

	# Ordering manifest so the service will run after all files, packages, and service iptables have been created, changed or restarted
	Yumrepo['inuits'] -> Package['mumble-server'] -> File['/etc/mumble-server.ini'] -> Service['mumble-server']
}
