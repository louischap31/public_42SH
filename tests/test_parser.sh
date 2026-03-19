#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "PARSER"

run_test "ls; date; whoami"
run_test "ls ; ;" 
run_test "if true; then ls; fi"
run_test "if true; then ls; else date; fi"
run_test "if true; then if false; then echo; fi; fi"
run_test "if; then ls; fi"
run_test "then ls; fi"
run_test "if
true
then
ls
fi"
run_test "if false; then echo no; elif true; then echo yes; else echo no; fi"
run_test "if false; then echo no; elif false; then echo no; elif true; then echo yes; fi"
run_test "if true; echo missing_then; fi"
run_test ";"
run_test "ls ; ; ls"

end_suite "PARSER"
