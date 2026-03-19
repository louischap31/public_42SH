#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "EXIT"

run_test "exit 0"
run_test "exit 42" 
run_test "exit"
run_test "exit 256" 
run_test "exit 257" 
run_test "exit 300"
run_test "exit salut"
run_test "exit 1 2"
run_test "exit 0; echo RATE" 
run_test "if exit 5; then echo RATE; fi"
run_test "exit -1"

end_suite "EXIT"
