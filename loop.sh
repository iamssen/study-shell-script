#!/usr/bin/env bash

source .util/assert.sh

# loop array
list=("a" "b" "c" "d")

result=""
for item in ${list[*]}; do
  result="$result$item"
done

assert "$result" "abcd"

# loop files
for file in .fixtures/*.txt; do
  if [ -e "$file" ]; then
    break
  else
    exit 1
  fi
done

# while
num=0
while [ $num -lt 5 ]; do
  num=$((num + 1))
done

assert $num 5

# until
num=0
until [ $num -gt 4 ]; do
  num=$((num + 1))
done

assert $num 5

# until file appears done from background to write
file=$(mktemp)

( (
  echo "a" >>"$file"
  sleep 0.3s
  echo "b" >>"$file"
  sleep 0.3s
  echo "c" >>"$file"
  sleep 0.3s
  echo "done" >>"$file"
) &>"$file" &)

count=10

until [ "$(tail -n 1 "$file")" = "done" ]; do
  sleep 0.4s
  count=$((count - 1))
  if [ $count -le 0 ]; then
    exit 1
  fi
done

arr=($(cat "$file"))
assert "${arr[*]}" "a b c done"

# redirect output of loop
file=$(mktemp)
result=""
for item in ${list[*]}; do
  echo "$item"
done >"$file"

arr=($(cat "$file"))
assert "${arr[*]}" "a b c d"
