#!/bin/sh
. "$(dirname "$0")/func_testsuite.sh"

init_suite "CD"

run_test "cd /tmp; pwd"
run_test "cd /; pwd"
run_test "HOME=/tmp cd; pwd"
run_test "cd /; cd /tmp; cd -"
run_test "cd /; echo \$PWD"
run_test "cd /; cd /tmp; echo \$OLDPWD"
run_test "cd /dossier_qui_n_existe_pas_12345"
run_test "unset OLDPWD; cd -"

touch not_a_dir
mkdir -p no_perm_dir
chmod 000 no_perm_dir

run_test "cd not_a_dir"
run_test "cd no_perm_dir"
run_test "cd too many args"

chmod 755 no_perm_dir
rm -rf no_perm_dir not_a_dir


end_suite "CD"
