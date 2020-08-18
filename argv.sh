#!/usr/bin/env bash

source .util/assert.sh

assert "$(bash argv/1.sh Nick)" "Hello Nick"
assert "$(bash argv/1.sh Seoyeon)" "Hello Seoyeon"

assert "$(bash argv/0.sh)" "file is 0.sh"

assert "$(bash argv/@.sh 1 2 3 4 5)" 15
assert "$(bash argv/@.sh 100 100 100)" 300

assert "$(bash argv/#.sh 1 2 3 4)" "length of argv is 4"
assert "$(bash argv/#.sh "a" "b")" "length of argv is 2"