#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "BASIC FEATURES"

run_test "true"
run_test "false"
run_test "echo hello"
run_test "echo -n no_newline"
run_test "ls -d /"
run_test "echo A; echo B"
run_test "true; false"
run_test "if true; then echo OK; fi"
run_test "if false; then echo NO; else echo YES; fi"
run_test "if false; then echo A; elif true; then echo B; fi"
run_test "if echo cond; true; then echo corps; fi"
run_test "commande_inexistante"
run_test "echo if then else fi while until for do done in"
run_test "ls if"
run_test "if true; then echo if; fi"

end_suite "BASIC FEATURES"
