#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

lua -v > version
lua ./solution.lua < ./input | tee output
