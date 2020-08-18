#!/usr/bin/env bash

num=0
for item in "$@"; do
  num=$((num + item))
done

echo "$num"