#!/usr/bin/env bash

source .util/assert.sh;

# should pass if pipe value is 0 or null
assert $((0 | 0 | 3)) 3;

# true = 1 / false = 0
assert $((2 < 1)) 0;
assert $((2 <= 2)) 1;
assert $((2 > 1)) 1;
assert $((1 >= 1)) 1;
assert $((1 == 1)) 1;
assert $((1 != 1)) 0;

# math
assert $((1 + 1 + 1)) 3;
assert $((5 - 4)) 1;
assert $((3 * 3)) 9;
assert $((9 / 3)) 3;
