#!/bin/sh
# file.tcl \
exec tclsh "$0" ${1+"$@"}

set fl [open fixtures/hello.txt r+ ]

set data [read $fl]

puts $data

if {[catch {close $fl} err]} {
    puts "ls command failed: $err"
}

