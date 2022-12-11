#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

janet solution.janet < input | tee output