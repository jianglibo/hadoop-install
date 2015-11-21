#!/bin/sh
# file.tcl \
exec tclsh "$0" ${1+"$@"}

#exec userdel tcltestuser

#exec useradd tcltestuser
#exec passwd tcltestuser
set status 0

set un tcltestuser

catch {exec id $un} results options
set rcode [dict get $options -code]

if {$rcode != 0} {
   exec useradd $un
   catch {exec echo axbc12x34x5\naxbc12x34x5 | passwd $un 2>&1} results1 options1
   puts ..................
   puts $results1
   puts ..................
   puts $options1

}  else {
   puts "deleting user $un"
   exec userdel -r $un
}


#puts $results
#puts "return code is $rcode"
#
#catch {exec -ignorestderr id $un} results options
#set rcode [dict get $options -code]
#puts $results
#puts "return code is $rcode"
#
#
#catch {exec id yarn} results options
#set rcode [dict get $options -code]
#puts $results
#puts "return code is $rcode"
#


#if {[catch {exec id $un} results options]} {
#   puts $results
#
#   puts $options
#
#   set details [dict get $options -errorcode]
#
#   if {[lindex $details 0] eq "CHILDSTATUS"} {
#
#      set status [lindex $details 2]
#      puts $status
#
#   } else {
#	puts  "hello yes"
#      # Some kind of unexpected failure
#     
#          }
#      
#         }
#   

#puts .................

#set ret [exec id tcltestuser]


#puts ret
