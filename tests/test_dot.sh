#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "DOT"

echo "echo sourced" > script_source.sh
echo "VAR=set_in_source" >> script_source.sh

run_test ". ./simple.sh"
run_test ". ./simple.sh; if [ \"\$DOT_VAR\" = \"success\" ]; then true; else false; fi"
run_test "EXISTING=original; . ./modify.sh; if [ \"\$EXISTING\" = \"modified\" ]; then true; else false; fi"
run_test "PATH=\$PATH:./subdir; . path_test; if [ \"\$PATH_VAR\" = \"found\" ]; then true; else false; fi"
run_test "."
run_test ". introuvable"
run_test ". ./locked.sh"

rm -f script_source.sh
end_suite "DOT"
