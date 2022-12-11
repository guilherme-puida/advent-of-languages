#!/usr/bin/env sh

set -eu

echo "Advent of Languages"

for i in *day*; do
  echo "$i"
  "$i/run.sh"
  echo
done
