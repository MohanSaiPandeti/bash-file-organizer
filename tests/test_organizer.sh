#!/bin/bash

SCRIPT="./organize.sh"
TEST_DIR="tests/test-data"

PASS=0
FAIL=0

cleanup() {
    rm -rf "$TEST_DIR"
}

pass() {
    echo "[PASS] $1"
    PASS=$((PASS + 1))
}

fail() {
    echo "[FAIL] $1"
    FAIL=$((FAIL + 1))
}

cleanup
mkdir -p "$TEST_DIR"

echo "Running Bash File Organizer tests..."
echo

# Test 1: Syntax
if bash -n "$SCRIPT"; then
    pass "Bash syntax"
else
    fail "Bash syntax"
fi

# Test 2: Help
if "$SCRIPT" --help >/dev/null 2>&1; then
    pass "Help command"
else
    fail "Help command"
fi

# Test 3: Create test files
touch "$TEST_DIR/photo.jpg"
touch "$TEST_DIR/resume.pdf"
touch "$TEST_DIR/song.mp3"
touch "$TEST_DIR/random.xyz"

"$SCRIPT" "$TEST_DIR" >/dev/null 2>&1

# Test 4: Images
if [ -f "$TEST_DIR/Images/photo.jpg" ]; then
    pass "Image organization"
else
    fail "Image organization"
fi

# Test 5: Documents
if [ -f "$TEST_DIR/Documents/resume.pdf" ]; then
    pass "Document organization"
else
    fail "Document organization"
fi

# Test 6: Audio
if [ -f "$TEST_DIR/Audio/song.mp3" ]; then
    pass "Audio organization"
else
    fail "Audio organization"
fi

# Test 7: Unknown extension
if [ -f "$TEST_DIR/Others/random.xyz" ]; then
    pass "Unknown extension handling"
else
    fail "Unknown extension handling"
fi

# Test 8: Recursive organization
mkdir -p "$TEST_DIR/subfolder"
touch "$TEST_DIR/subfolder/test.py"

"$SCRIPT" --recursive "$TEST_DIR" >/dev/null 2>&1

if [ -f "$TEST_DIR/Code/test.py" ]; then
    pass "Recursive organization"
else
    fail "Recursive organization"
fi

# Test 9: Duplicate handling
touch "$TEST_DIR/photo.jpg"

"$SCRIPT" "$TEST_DIR" >/dev/null 2>&1

if [ -f "$TEST_DIR/Images/photo_1.jpg" ]; then
    pass "Duplicate filename handling"
else
    fail "Duplicate filename handling"
fi

# Test 10: Dry run
touch "$TEST_DIR/test.txt"

"$SCRIPT" --dry-run "$TEST_DIR" >/dev/null 2>&1

if [ -f "$TEST_DIR/test.txt" ]; then
    pass "Dry-run mode"
else
    fail "Dry-run mode"
fi

cleanup

echo
echo "Tests passed: $PASS"
echo "Tests failed: $FAIL"

if [ "$FAIL" -eq 0 ]; then
    echo "All tests passed."
    exit 0
else
    echo "Some tests failed."
    exit 1
fi