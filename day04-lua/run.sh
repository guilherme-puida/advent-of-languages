#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

lua ./solution.lua < ./input | tee output
