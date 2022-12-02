#!/usr/bin/env sh

set -eu

set -a
. ./.cookie
set +a

curl -H "Cookie: $AOC_COOKIE" -A "github.com/guilherme-puida/advent-of-languages by guilherme@puida.xyz" "https://adventofcode.com/$1/day/$2/input"
