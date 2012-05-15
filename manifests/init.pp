# = Class: mumble-server
#
# This class installs the mumble-server
#
# == Parameters:
#
# $mumble_password::   This global variable is used to set the mumble server password used by clients to connect
# $mumble_port::  The port used where clients have to connect to for communication
#
# == Actions:
#   Install the mumble 1.2.3 server by creating the mumble-server user & group, copying the necessary service and configuration files, creating the necessary directories and restarting the services mumble-server & iptables
#
# == Requires:
#
# == Sample Usage:
#
#	class {'mumble-server::manual':
#		mumble_password => 'letsmumble',
#		mumble_port 	=> '64738',
#	}
#	class {'mumble-server::rpm':
#		mumble_password => 'letsmumble',
#		mumble_port 	=> '64738',
#	}
#
class mumble-server (){
}
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
	# Creating and importing mumble-server configuration file
	file { "/etc/mumble-server.ini":
		owner 	=> "root",
		group	=> "root",
		replace => "true",
		content => template("mumble-server/mumble-server.erb"),
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
	# Starting mumble-server service
	service { "mumble-server":
	    	hasstatus	=> true,
	    	enable     	=> true,
		ensure     	=> running,
	    	subscribe => File["/etc/mumble-server.ini"],
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
	# Creating and importing mumble-server configuration file
	file { "/etc/mumble-server.ini":
		owner 	=> "root",
		group	=> "root",
		replace => "true",
		content => template("mumble-server/mumble-server.erb"),
	}
	# Starting mumble-server service
	service { "mumble-server":
	    	hasstatus	=> true,
	    	enable     	=> true,
		ensure     	=> running,
	    	subscribe => File["/etc/mumble-server.ini"],
	}  

	# Ordering manifest so the service will run after all files, packages, and service iptables have been created, changed or restarted
	Yumrepo['inuits'] -> Package['mumble-server'] -> File['/etc/mumble-server.ini'] -> Service['mumble-server']
}
