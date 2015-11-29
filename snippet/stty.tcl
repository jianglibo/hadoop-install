#!/bin/sh
# stty.tcl \
exec tclsh "$0" ${1+"$@"}

proc getpassword {{prompt "Password: "}} {
    puts -nonewline $prompt
    flush stdout
    # disable echoing
    exec stty -echo
    catch { gets stdin } password options
    exec stty echo
    return -options $options $password
}

proc enableRaw {{channel stdin}} {
   exec /bin/stty raw -echo <@$channel
}
proc disableRaw {{channel stdin}} {
   exec /bin/stty -raw echo <@$channel
}

enableRaw
set c [read stdin 1]
puts -nonewline $c
disableRaw

package require twapi
proc enableRawWin {{channel stdin}} {
   set console_handle [twapi::GetStdHandle -10]
   set oldmode [twapi::GetConsoleMode $console_handle]
   set newmode [expr {$oldmode & ~6}] ;# Turn off the echo and line-editing bits
   twapi::SetConsoleMode $console_handle $newmode
}
proc disableRawWin {{channel stdin}} {
   set console_handle [twapi::GetStdHandle -10]
   set oldmode [twapi::GetConsoleMode $console_handle]
   set newmode [expr {$oldmode | 6}] ;# Turn on the echo and line-editing bits
   twapi::SetConsoleMode $console_handle $newmode
}

enableRawWin
set c [read stdin 1]
puts -nonewline $c
disableRawWin