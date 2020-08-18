#!/usr/bin/env bash

source .util/assert.sh

num=0

function handleExit() {
  assert $num 4
}

# man signal
trap "handleExit" EXIT

num=$((num + 1))
num=$((num + 1))
num=$((num + 1))
num=$((num + 1))
