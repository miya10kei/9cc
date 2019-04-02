#!/bin/bash

try() {
  expected="$1"
  input="$2"

  ./km9cc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$expected expected, but got $actual"
  fi
}

try 0 0
try 42 42
try 21 '5+20-4'
try 41 " 12 + 34 - 5 "
try 41 " 12 + ( 34 - 5 )"
try 41 " (12) + ( 34 - 5 )"
try 1 " 5 * 4 / 20"
try 12  " ( 2 + 3 - 1 ) * 6 / 2"


echo OK
