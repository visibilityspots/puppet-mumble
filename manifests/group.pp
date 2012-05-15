# = Class: mumble-server_group
#
# This class creates the mumble-server_group
#
# == Parameters:
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
# 
class mumble-server_group {
	# Creating mumble-server group
	group { "mumble-server":
		ensure => present,
		gid => '4000',
	}
}
