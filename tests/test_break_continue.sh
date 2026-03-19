#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "BREAK & CONTINUE"

run_test "for i in 1 2; do echo \$i; break; done"
run_test "while true; do echo A; break; echo B; done"
run_test "until false; do echo A; break; echo B; done"
run_test "for i in 1 2; do echo A; continue; echo B; done"
run_test "for i in A B; do echo \$i; for j in 1 2; do echo \$j; break; done; done"
run_test "for i in A; do for j in 1 2; do echo \$j; continue; echo SKIPPED; done; done"
run_test "break; echo VIVANT"
run_test "continue; echo VIVANT"
run_test "true; break; echo \$?"
run_test "for i in 1 2; do echo A\$i; for j in a b; do echo B\$j; break 2; done; echo C\$i; done"
run_test "for i in 1 2; do echo A\$i; for j in 1 2; do echo B\$j; continue 2; done; echo C\$i; done"
run_test "for i in 1; do break toto; echo VIVANT; done"
run_test "for i in 1 2; do echo A; for j in 1; do echo B; break 10; done; echo C; done"
run_test "for i in 1; do break 1 2; echo VIVANT; done"

end_suite "BREAK & CONTINUE"
