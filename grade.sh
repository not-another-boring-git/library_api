TEST_OUTPUT=$(mix test)

if [ $? -ne 0 ]; then
    echo "grade=0" >> $GITHUB_OUTPUT
    echo "::error::Tests failed to run properly"
    exit 1
fi

TOTAL_TESTS=$(echo "$TEST_OUTPUT" | grep -o '[0-9]* tests' | awk '{print $1}')
if [ -z "$TOTAL_TESTS" ] || [ "$TOTAL_TESTS" -eq 0 ]; then
    echo "grade=0" >> $GITHUB_OUTPUT
    echo "::error::No tests found or tests failed to parse"
    exit 1
fi

PASSED_TESTS=$(echo "$TEST_OUTPUT" | grep -o '[0-9]* test' | head -n 1 | awk '{print $1}')
GRADE=$((PASSED_TESTS * 100 / TOTAL_TESTS))


echo "grade=$GRADE" >> $GITHUB_OUTPUT
echo "::notice::Grade: $GRADE% ($PASSED_TESTS/$TOTAL_TESTS tests passed)"
