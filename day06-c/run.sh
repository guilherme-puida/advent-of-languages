#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

cc --version > version
cc -o solution solution.c
./solution < input | tee output

rm ./solution
