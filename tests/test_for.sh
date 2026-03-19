#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "FOR"

run_test "for i in 1 2 3; do echo tour; done"
run_test "for i 
in 1 2
do echo A
done"
run_test "for 123 in a b; do echo bad_var; done"
run_test "for i in a b; echo missing_do; done"
run_test "for i do echo implicit_in; done"

end_suite "FOR"
