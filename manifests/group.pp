# = Class: mumble::group
#
# This class creates the mumble group
#
# == Parameters:
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
# 
class mumble::group {
	# Creating mumble-server group
	group { "mumble-server":
		ensure => present,
		gid => '4000',
	}
}
