#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

ruby solution.rb < ./input | tee output