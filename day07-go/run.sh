#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

go version > version
go run solution.go < input | tee output