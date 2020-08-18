#!/usr/bin/env bash

source .util/assert.sh

function exitWith0() {
  return 0
}

function exitWith1() {
  return 1
}

# exit codes
# 0   success
# 1   unknown error
# 2   used wrong command
# 126 couldn't run command
# 127 couldn't find command
# 130 interrupt with ctrl+c
# 255 exit code out of range

exitWith0
assert $? 0

exitWith1
assert $? 1
