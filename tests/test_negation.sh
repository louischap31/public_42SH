#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "NEGATION"

run_test "! true"
run_test "! false"
run_test "! ! true"
run_test "! ! false"
run_test "! echo A"
run_test "if ! true; then echo RATE; else echo REUSSI; fi" 
run_test "if ! false; then echo REUSSI; else echo RATE; fi" 
run_test "if ! ! true; then echo REUSSI; else echo RATE; fi" 
run_test "! ! true" 
run_test "! |"
run_test "ls !" 
run_test "! true"
run_test "! false" 
run_test "if ! true; then echo no; else echo yes; fi"


end_suite "NEGATION"
