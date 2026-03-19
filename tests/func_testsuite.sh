#!/bin/sh

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREY='\033[1;30m'
NC='\033[0m'

if [ -z "$BIN_PATH" ]; then
    BINARY="../src/42sh"
else
    BINARY="$BIN_PATH"
fi

TOTAL_TESTS=0
PASSED_TESTS=0

init_suite() {
    echo "\n${BLUE} $1 ${NC}"
}

run_test() {
    CMD="$1"
    DESC="$2"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    bash --posix -c "$CMD" > /tmp/ref_out 2> /tmp/ref_err
    RET_REF=$?

    timeout 2s "$BINARY" -c "$CMD" > /tmp/my_out 2> /tmp/my_err
    RET_MY=$?

    FAIL=0

    if [ $RET_REF -ne $RET_MY ]; then
        FAIL=1
    fi

    DISPLAY_CMD=$(echo "$CMD" | tr '\n' ' ')

    diff -q /tmp/ref_out /tmp/my_out > /dev/null
    if [ $? -ne 0 ]; then
        FAIL=1
    fi

    if [ $FAIL -eq 0 ]; then
        PASSED_TESTS=$((PASSED_TESTS + 1))
        echo "Test $TOTAL_TESTS : ${GREEN}[OK]${NC} $DISPLAY_CMD"
        if [ -n "$RESULTS_LOG" ]; then echo "PASS" >> "$RESULTS_LOG"; fi
    else
        echo "Test $TOTAL_TESTS : ${RED}[KO]${NC} $DISPLAY_CMD"
        if [ -n "$RESULTS_LOG" ]; then echo "FAIL" >> "$RESULTS_LOG"; fi
    fi

    rm -f /tmp/ref_out /tmp/ref_err /tmp/my_out /tmp/my_err
}


end_suite() {
    printf "\n"

    if [ "$PASSED_TESTS" -eq "$TOTAL_TESTS" ]; then
        printf "${GREEN}Success: %d/%d tests passed${NC}\n" "$PASSED_TESTS" "$TOTAL_TESTS"
    else
        printf "${RED}Failed: %d/%d tests passed${NC}\n" "$PASSED_TESTS" "$TOTAL_TESTS"
    fi
}
