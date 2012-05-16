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
