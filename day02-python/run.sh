#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

python --version > version
python solution.py < ./input | tee output
