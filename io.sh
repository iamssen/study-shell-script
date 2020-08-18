#!/usr/bin/env bash

source .util/assert.sh

file=$(mktemp)

echo "override 1" >"$file"
echo "override 2" >"$file"
echo "override 3" >"$file"

# shellcheck disable=SC2129
echo "append 1" >>"$file"
echo "append 2" >>"$file"
echo "append 3" >>"$file"

echo "ignore 1" >/dev/null
echo "ignore 2" >/dev/null
echo "ignore 3" >/dev/null

arr=($(cat "$file"))
assert "${arr[*]}" "override 3 append 1 append 2 append 3"

# redirect all
file=$(mktemp)

( (
  echo 'a'
  sleep 0.3s
  echo 'b'
  sleep 0.3s
  echo 'c'
) &>"$file" &)

sleep 2s

arr=($(cat "$file"))
assert "${arr[*]}" "a b c"

# redirect data and error separately
data=$(mktemp)
error=$(mktemp)

( (
  echo 'a'
  echo 'x' >&2 # redirect to error
  sleep 0.3s
  echo 'b'
  echo 'y' >&2
  sleep 0.3s
  echo 'c'
  echo 'z' >&2
) 2>"$error" 1>"$data" &)

sleep 2s

data_arr=($(cat "$data"))
assert "${data_arr[*]}" "a b c"

error_arr=($(cat "$error"))
assert "${error_arr[*]}" "x y z"