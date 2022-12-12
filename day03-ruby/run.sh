#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

ruby --version > version
ruby solution.rb < ./input | tee output