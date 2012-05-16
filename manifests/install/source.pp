# Installation of the mumble service by creating the necessary files manualy
class mumble::install::source ($mumble_password, $mumble_port) {
	# Importing directory's for creating groups and users
	import 'groups/*.pp' 
	import 'users/*.pp'

	# Include mumble user and group classes
	include mumble::group
	include mumble::user 

	# Importing files for mumble service
	file { '/usr/sbin/murmurd':
		owner  => 'root',
		group  => 'root',
		source => 'puppet:///modules/mumble/murmur.x86',
	}	

	file { '/etc/rc.d/init.d/mumble-server':
		owner  => 'root',
		group  => 'root',
		mode   => '0755',
		source => 'puppet:///modules/mumble/mumble-server',
	}

	# Creating mumble-server directories
	file { '/var/lib/mumble-server':
		ensure => 'directory',
		owner  => 'mumble-server',
		group  => 'mumble-server',
	}

	file { '/var/log/mumble-server':
		ensure => 'directory',
		owner  => 'mumble-server',
		group  => 'mumble-server',
	}

	# Ordering manifest so the service will run after all files, users, groups and iptables have been created or changed
	Group['mumble-server'] -> User['mumble-server'] -> File['/usr/sbin/murmurd'] -> File['/etc/mumble-server.ini'] -> File['/etc/rc.d/init.d/mumble-server'] -> File['/var/lib/mumble-server'] -> File['/var/log/mumble-server'] -> Service['mumble-server']
}
