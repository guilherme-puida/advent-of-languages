#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

nim --version > version
nim r solution.nim < input | tee output