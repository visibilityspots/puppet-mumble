# = Class: mumble-server_user
#
# This class creates the mumble-server_user
#
# == Parameters:
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
# 
class mumble-server_user {
	# Creating mumble-server user
	user { "mumble-server":
		ensure 	=> "present",
		gid	=> "4000",
		shell	=> "/sbin/nologin",
	} 
} 
