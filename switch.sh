#!/usr/bin/env bash

result="?"

function func() {
  case $1 in
  "a") result="aa" ;;
  "b") result="bb" ;;
  *) result="**" ;;
  esac
}

func "a"
if [ "$result" = "aa" ]; then
  echo "ok" >/dev/null
else
  exit 1
fi

func "b"
if [ "$result" = "bb" ]; then
  echo "ok" >/dev/null
else
  exit 1
fi

func "z"
if [ "$result" = "**" ]; then
  echo "ok" >/dev/null
else
  exit 1
fi
