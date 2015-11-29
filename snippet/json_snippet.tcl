#!/bin/sh
# json.tcl \
exec tclsh "$0" ${1+"$@"}

package require json

set js [::json::json2dict "{\"a\":1}"]
puts $js