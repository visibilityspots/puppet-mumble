class mumble::user {
	# Creating mumble-server user
	user{'mumble-server':
		ensure => 'present',
		gid    => '4000',
		shell  => '/sbin/nologin',
	} 
} 
