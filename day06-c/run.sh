#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

cc -o solution solution.c
./solution < input

rm ./solution
