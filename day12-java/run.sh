#!/usr/bin/env sh

cd "$(dirname "$0")" || exit

javac --version > version
java --version >> version
javac solution.java
java solution < input | tee output

rm *.class