#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "SUBSHELLS"

run_test "(exit 42)"
run_test "a=1; (a=2; echo \$a); echo \$a"
run_test "pwd > /tmp/ref; (cd /; pwd); pwd > /tmp/act; diff /tmp/ref /tmp/act; rm /tmp/ref /tmp/act"
run_test "(echo A; echo B;)"
run_test "(echo A)"
run_test " ( echo A ) "
run_test "( ( ( ( echo profond ) ) ) )"
run_test "if (true); then echo yes; fi"
run_test "while (exit 42); do echo fail; done"
run_test "(echo A; echo B) | cat | tr A C"
run_test "(echo A) 2>/dev/null >/dev/null"
run_test "(exit 12); echo \$?"
run_test "(
echo A
echo B
)"
run_test "echo A)"
run_test "echo A ( echo B"
run_test "()"
run_test "(echo A)echo B"
run_test "(echo A)(echo B)"
run_test "( ; )"

end_suite "SUBSHELLS"
