#!/usr/bin/env sh

set -eu

set -a
. ./.cookie
set +a

curl -H "Cookie: $AOC_COOKIE" "https://adventofcode.com/$1/day/$2/input"
