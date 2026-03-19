#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "WHILE & UNTIL"

run_test "while false; do echo RATE; done" 
run_test "while echo CHECK; false; do echo RATE; done"
run_test "while ! true; do echo RATE; done"
run_test "until true; do echo RATE; done" 
run_test "until echo CHECK; true; do echo RATE; done"
run_test "until ! false; do echo RATE; done" 
run_test "while false; echo A; done" 
run_test "while true; echo missing_do; done"
run_test "until false; echo missing_do; done" 
run_test "while; do echo empty_cond; done"

end_suite "WHILE & UNTIL"
