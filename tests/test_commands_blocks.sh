#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "COMMAND BLOCKS"

run_test "{ echo A; echo B; }"
run_test "{ { echo imbrique; }; }"
run_test "{ echo A; echo B; } | cat"
run_test "if true; then { echo dans_if; }; fi" 
run_test "{ echo A; } && { echo B; }"
run_test "echo avant; { echo dedans; }; echo apres" 
run_test "! { false; }"
run_test "echo fermé; }" 
run_test "{ echo A; } extra" 
run_test "{echo collé;}"
run_test "{ echo collé;}"

rm -f block_out
end_suite "COMMAND BLOCKS"
