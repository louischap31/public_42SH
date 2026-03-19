#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "UNSET"

run_test "foo=bar; unset foo; [ -z \"\$foo\" ]"
run_test "a=1 b=2 c=3; unset a c; [ -z \"\$a\" ] && [ \"\$b\" = 2 ] && [ -z \"\$c\" ]"
run_test "unset variable_imaginaire"
run_test "foo=bar; unset foo; unset foo; [ -z \"\$foo\" ]"
run_test "foo=bar; unset -v foo; [ -z \"\$foo\" ]"
run_test "a=1; unset -v a fantome; [ -z \"\$a\" ]"
run_test "unset -f fonction_imaginaire"
run_test "foo=bar; unset -f foo; [ \"\$foo\" = bar ]"
run_test "foo=bar; unset foo; [ -z \"\${foo+x}\" ]"
run_test "unset -z foo"
run_test "unset -f fonction_imaginaire"
run_test "foo=bar; unset -f foo; [ \"\$foo\" = bar ]"


end_suite "UNSET"
