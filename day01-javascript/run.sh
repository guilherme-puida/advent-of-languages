#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

node --version > version
node solution.js < input | tee output
