#!/usr/bin/env bash

source .util/assert.sh

my_arr=(a b c d)
# should print first line only
assert "${my_arr}" "a"
# by index
assert "${my_arr[0]}" "a"
# to string
assert "${my_arr[*]}" "a b c d"
# get index
assert "${#my_arr[*]}" "4"
# delete item
unset "my_arr[1]"
assert "${my_arr[*]}" "a c d"

# get array from text file
my_txt_arr=($(cat .fixtures/array.txt))
assert "${my_txt_arr}" "a"
assert "${my_txt_arr[0]}" "a"
assert "${my_txt_arr[*]}" "a b c d"
assert "${#my_txt_arr[*]}" "4"
