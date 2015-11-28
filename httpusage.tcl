#!/bin/sh
# httpusage.tcl \
exec tclsh "$0" ${1+"$@"}

package require http

proc httpcopy { url file {chunk 4096} } {
   set out [open $file w]
   set token [::http::geturl $url -channel $out \
	  -progress httpCopyProgress -blocksize $chunk]
   close $out

   # This ends the line started by httpCopyProgress
   puts stderr ""

   upvar #0 $token state
   set max 0
   foreach {name value} $state(meta) {
      if {[string length $name] > $max} {
	 set max [string length $name]
      }
      if {[regexp -nocase ^location$ $name]} {
	 # Handle URL redirects
	 puts stderr "Location:$value"
	 return [httpcopy [string trim $value] $file $chunk]
      }
   }
   incr max
   foreach {name value} $state(meta) {
      puts [format "%-*s %s" $max $name: $value]
   }

   return $token
}
proc httpCopyProgress {args} {
   puts -nonewline stderr .
   flush stderr
}

httpcopy http://www.fh.gov.cn fixturesout/fhgov.html