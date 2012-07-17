class mumble::group {
	# Creating mumble-server group
	group{'mumble-server':
		ensure => present,
		gid    => '4000',
	}
}
