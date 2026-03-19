#!/bin/sh

BLUE='\033[0;34m'
NC='\033[0m'

cd "$(dirname "$0")" || exit 0

echo "${BLUE}LANCEMENT TESTSUITE${NC}"

if [ -z "$BIN_PATH" ]; then
    if [ -x "../src/42sh" ]; then
        export BIN_PATH="$(cd ../src && pwd)/42sh"
    elif [ -x "../42sh" ]; then
        export BIN_PATH="$(cd .. && pwd)/42sh"
    else
        echo "Erreur: Je trouve pas le binaire 42sh"
        exit 0
    fi
fi

export RESULTS_LOG="/tmp/42sh_results"
rm -f "$RESULTS_LOG"
touch "$RESULTS_LOG"

echo "Binaire : $BIN_PATH"


for script in test_*.sh; do
    if [ -x "$script" ]; then
        ./"$script"
    fi
done

TOTAL=$(wc -l < "$RESULTS_LOG")
REUSSI=$(grep -c "PASS" "$RESULTS_LOG")

if [ "$TOTAL" -gt 0 ]; then
    SCORE=$(( (REUSSI * 100) / TOTAL ))
else
    SCORE=0
fi

echo "Total : $REUSSI / $TOTAL ($SCORE%)"

if [ -n "$OUTPUT_FILE" ]; then
    echo -n "$SCORE" > "$OUTPUT_FILE"
fi

rm -f "$RESULTS_LOG"
exit 0
