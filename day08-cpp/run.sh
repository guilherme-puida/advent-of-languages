#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

g++ --version > version
g++ -o solution solution.cpp
./solution < input | tee output

rm ./solution
