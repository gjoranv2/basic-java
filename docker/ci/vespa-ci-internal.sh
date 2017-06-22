#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x

SOURCE_DIR=~/basic-java
NUM_CORES=$(nproc --all)
NUM_THREADS=$((${NUM_CORES} * 2))

mkdir "${SOURCE_DIR}"
git clone --no-hardlinks /basic-java "${SOURCE_DIR}"

cd "${SOURCE_DIR}"
MAVEN_OPTS="-Xms128m -Xmx512m" mvn -T ${NUM_THREADS} install

echo "Success!"
