#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x


pwd
DIR=$(dirname $(readlink -f $0))
cd $DIR

BUILD_DOCKER_IMAGE="vespabuild"
CI_DOCKER_IMAGE="vespaci"

# Create a temporary copy of the rpm spec file inside docker directory so it can be referenced by the Dockerfile
rm -rf tmp; mkdir tmp
cp -p vespa.spec tmp/vespa.spec

docker build -t "$BUILD_DOCKER_IMAGE" -f Dockerfile .

docker run --rm -v ${DIR}/..:/basic-java --entrypoint /vespa-ci-internal.sh "$BUILD_DOCKER_IMAGE" \
   2>&1 | tee vespa-ci-$(date +%Y-%m-%dT%H:%M:%S%z).log
