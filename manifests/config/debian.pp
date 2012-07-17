class mumble::config::debian {
	package { 'mumble-server':
		ensure 	=> 'installed',
	}
}
