#!/bin/sh
# client.tcl \
exec tclsh "$0" ${1+"$@"}

# This is client.tcl.

    # Invoke as "client.tcl <filename>" (for a local file).


    set service_port 3456
    set service_host localhost ;# Old web site - need to change!

    proc send_one_file name {
	set size [file size $name]
	set fp [open $name]
	fconfigure $fp -translation binary

	set channel [socket $::service_host $::service_port]
	fconfigure $channel -translation binary
	puts $channel [list $name $size]

	fcopy $fp $channel -size $size

	close $fp
	close $channel
    }

#    send_one_file $argv
    send_one_file fixtures/hello.txt