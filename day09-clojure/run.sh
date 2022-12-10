#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

bb ./solution.clj < input | tee output