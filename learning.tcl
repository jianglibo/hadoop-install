#!/bin/sh
# hinstall.tcl \
exec tclsh "$0" ${1+"$@"}

set a 0

while {$a < 4 } {
	puts "while $a"
	incr a
}

set l { 1 3 5 7 }

foreach x $l {
	puts "foreach $x"
}

foreach {x y} $l {
	puts "foreach $x $y"
}

set ns "1"

if {$ns == 1} {
	puts "\"1\" and 1 are equal."
}

puts [ expr 1 + "6" ]
puts [ expr 1 + int("1") ]
puts [ concat 1 "a" ]
puts [ join { 1 "a" } "!" ]