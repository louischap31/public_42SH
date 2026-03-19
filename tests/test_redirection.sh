#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "REDIRECTION"
echo "input content" > input.txt

run_test "rm -f out.txt; echo on test > out.txt; cat out.txt"
run_test "rm -f out.txt; echo on test > out.txt; echo append >> out.txt; cat out.txt"
run_test "cat < input.txt"
run_test "rm -f err.txt; ls non_existant 2> err.txt; cat err.txt"
run_test "rm -f out.txt; ls non_existant > out.txt 2>&1; cat out.txt"
run_test "rm -f out.txt; set -C; echo base > out.txt; echo clob >| out.txt; cat out.txt"
run_test "echo test >&-"
run_test "echo test >&42"
run_test "rm -f out.txt; echo exist > out.txt; set -C; echo no > out.txt"
run_test "rm -f out.txt; echo exist > out.txt; set -C; set +o noclobber; echo ok > out.txt; cat out.txt"
run_test "rm -f out.txt; echo base > out.txt; echo readwrite 1<> out.txt; cat out.txt"
run_test "> out_empty.txt"
run_test ">> out_empty.txt"
run_test "echo > |" 
mkdir -p is_a_dir

touch readonly_file
chmod 444 readonly_file

run_test "echo test > is_a_dir"
run_test "echo test > readonly_file"
run_test "cat < is_a_dir"

rm -rf is_a_dir readonly_file
rm -f out.txt err.txt input.txt out_empty.txt

end_suite "REDIRECTION"
