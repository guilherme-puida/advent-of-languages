#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

crystal --version > version
crystal run ./solution.cr < ./input | tee output