#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "PIPELINES"

run_test "echo salut | cat"
run_test "echo a b c | tr ' ' '\n' | grep b"
run_test "true | false"
run_test "false | true"

run_test "true && echo yes"
run_test "false && echo no" 
run_test "false || echo yes" 
run_test "true || echo no"
run_test "echo A | cat && echo B" 
run_test "echo 'Hello World'" 
run_test "echo \"Hello World\"" 
run_test "echo ' \" '"
run_test "echo \" ' \"" 
run_test "echo \"A \\\" B\""
run_test "echo \"A \\\\ B\"" 
run_test "|" 
run_test "&& true" 

end_suite "PIPELINES"
