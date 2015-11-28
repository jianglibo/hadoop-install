#!/bin/sh
# file.tcl \
exec tclsh "$0" ${1+"$@"}

exec userdelete tcltestuser

exec useradd tcltestuser
exec passwd tcltestuser
