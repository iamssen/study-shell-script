#!/usr/bin/env bash

source .util/assert.sh

# return value is exit status

function funcNormal() {
  echo 'ok' >/dev/null
}

funcNormal
assert $? 0

function func0() {
  return 0
}

func0
assert $? 0

function funcHangup() {
  # macos returns 1
  # ubuntu returns 2
  ls -l badlocation
}

funcHangup &>/dev/null
hangupExitStatus=$?
if [ $hangupExitStatus -lt 1 ]; then
  echo "exit status of funcHangup is $?"
  exit 1
fi

function func1() {
  return 1
}

func1
assert $? 1

# function return

function returnString() {
  echo "hello"
}

assert "$(returnString)" "hello"

function returnNumber() {
  echo 1
}

assert "$(returnNumber)" 1

function returnArray() {
  local array=(1 2 3 4 5)
  echo "${array[*]}"
}

arrValue=($(returnArray))
assert "${arrValue[*]}" "1 2 3 4 5"

# argv

function argvLength() {
  echo $#
}

assert "$(argvLength "a" "b" "c")" 3

function argv0() {
  basename "$0"
}

assert "$(argv0 "hello")" "function.sh"

function argv1() {
  echo "$1"
}

assert "$(argv1 "hello")" "hello"

function argv@() {
  num=0
  for item in "$@"; do
    num=$((num + item))
  done

  echo "$num"
}

assert "$(argv@ 1 2 3 4 5)" 15

# scope

var=10

function haveLocalVariable() {
  local var=20
  assert "$var" 20
}

haveLocalVariable

assert "$var" 10

