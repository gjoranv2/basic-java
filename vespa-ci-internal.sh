#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x

SOURCE_DIR=~/src
BUILD_DIR=~/build
NUM_CORES=$(nproc --all)
NUM_THREADS=$((${NUM_CORES} * 2))

mkdir "${SOURCE_DIR}"
mkdir "${BUILD_DIR}"
#git clone --no-checkout --local --no-hardlinks file:///basic-java "${SOURCE_DIR}"
cd "${SOURCE_DIR}"
echo "Success!"