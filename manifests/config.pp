class mumble::config {
	case $::operatingsystem {
	    'debian', 'ubuntu': {
	      include mumble::config::debian
	    }

	    'centos', 'redhat': {
	      include mumble::config::redhat
	    }
	    default: {
	      fail 'Operatingsystem not supported.'
	    }
	  }
}
