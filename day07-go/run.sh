#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

go run solution.go < input | tee output