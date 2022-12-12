#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

bb --version > version
bb ./solution.clj < input | tee output