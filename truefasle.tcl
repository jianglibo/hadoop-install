#!/bin/sh
# truefasle.tcl \
exec tclsh "$0" ${1+"$@"}

set c 0

if $c {
	puts "0 is false"
}

set c "";

# use catch

#The if command evaluates expr1 as an expression (in the same way that expr evaluates its argument).
#The value of the expression must be a boolean 
#(a numeric value, where 0 is false and anything is true, or a string value such as true or yes for true and false or no for false);
#if it is true then body1 is executed by passing it to the Tcl interpreter. 
#Otherwise expr2 is evaluated as an expression and if it is true then body2 is executed, and so on. 
#If none of the expressions evaluates to true then bodyN is executed. 
#The then and else arguments are optional “noise words” to make the command easier to read. 
#There may be any number of elseif clauses, including zero. BodyN may also be omitted as long as else is omitted too. 
#The return value from the command is the result of the body script that was executed, 
#or an empty string if none of the expressions was non-zero and there was no bodyN.

if {
[ catch {
	if $c {
		puts "empty is false"
	}
} err ] } {
	puts "catch error: $err"
}

set c "0"

