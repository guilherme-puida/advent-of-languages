#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

nim r solution.nim < input | tee output