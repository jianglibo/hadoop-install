#!/bin/sh
# file.tcl \
exec tclsh "$0" ${1+"$@"}

set l {a b c}

puts [lindex $l 0]
set lc {lindex $l 0}
