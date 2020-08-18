#!/usr/bin/env bash

if true; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if false; then
  exit 1
else
  echo 'ok' >/dev/null
fi

if false; then
  exit 1
elif true; then
  echo 'ok' >/dev/null
fi

if ((3 > 1)); then
  echo 'ok' >/dev/null
else
  exit 1
fi

if ((3 < 1)); then
  exit 1
else
  echo 'ok' >/dev/null
fi

num=10
if ((num > 3)); then
  echo 'ok' >/dev/null
else
  exit 1
fi

if ((num + 10 == 20)); then
  echo 'ok' >/dev/null
else
  exit 1
fi

# man test

# number -eq number
# number -ne number
# number -gt number
# number -ge number
# number -lt number
# number -le number
if [ $num -gt 1 ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if [ $num -lt 20 ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# is directory
if [ -d .util ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if [ ! -d .util/assert.sh ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# is file
if [ -f .util/assert.sh ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if [ ! -f .util ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# exits
if [ -e .gitignore ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if [ ! -e .foo ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# file size greater than 0
if [ -s .fixtures/array.txt ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if [ ! -s .fixtures/blank.txt ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# text compare
# text = text
# text != text
# -n text
# -z text
text="a"
if [ $text = "a" ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if [ $text != "b" ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# is text length higher than 0
if [[ -n $text ]]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

empty=""
# is text length 0
if [[ -z $empty ]]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# and
if true && true; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if true && false; then
  exit 1
else
  echo 'ok' >/dev/null
fi

if [ $text = "a" ] && [ $num -gt 1 ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi

# or
if false || true; then
  echo 'ok' >/dev/null
else
  exit 1
fi

if false || false; then
  exit 1
else
  echo 'ok' >/dev/null
fi

if [ $text = "b" ] || [ $num -gt 1 ]; then
  echo 'ok' >/dev/null
else
  exit 1
fi
