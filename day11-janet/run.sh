#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

janet -v > version
janet solution.janet < input | tee output