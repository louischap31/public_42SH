#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "VARIABLES"

run_test "FOO=bar; echo \$FOO"
run_test "VAR=abc; VAR=def; echo \$VAR"
run_test "echo \$UNDEFINED_VAR" 
run_test "A=1; B=2; echo \$A; echo \$B"
run_test "NAME=world; echo hello_\$NAME"
run_test "1=test"
run_test "/=slash"
run_test ".=dot"
run_test "VAR=titi; echo \${VAR}"
run_test "VAR=titi; echo \${VAR}titi"
run_test "VAR=val; echo P_\${VAR}_S"
run_test "VAR=val; echo \$VAR."
run_test "VAR=val; echo \$VAR.."
run_test "VAR=val; VAR_=autre; echo \$VAR_"
run_test "true; echo \$?"
run_test "false; echo \$?"
run_test "echo \${unclosed"

end_suite "VARIABLES"