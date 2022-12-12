#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

javac solution.java
java solution < input | tee output

rm *.class