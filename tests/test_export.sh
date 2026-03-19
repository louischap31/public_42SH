#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "EXPORT"


run_test "export TEST=42; echo \$TEST"
run_test "TESTE=salut; export TESTE; echo \$TESTE"
run_test "export TESTS=initial; TESTS=modif; echo \$TESTS"
run_test "export T; echo \"|\$T|\"" 
run_test "export MEmory=check" 
run_test "export 1var=test" 
run_test "export var-tiret=test"
run_test "export =valeur" 


end_suite "EXPORT"
