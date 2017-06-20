#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x


DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
cd $DIR

BUILD_DOCKER_IMAGE="vespabuild"
CI_DOCKER_IMAGE="vespaci"

docker build -t "$BUILD_DOCKER_IMAGE" -f Dockerfile.build .

rm -rf tmp; mkdir tmp

docker build -t "$CI_DOCKER_IMAGE" -f Dockerfile.ci .
docker run --rm --entrypoint /vespa-ci-internal.sh "$BUILD_DOCKER_IMAGE" \
   2>&1 | tee vespa-ci-$(date +%Y-%m-%dT%H:%M:%S%z).log
