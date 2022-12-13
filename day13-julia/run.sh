#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

julia --version > version
julia ./solution.jl < ./input | tee output
