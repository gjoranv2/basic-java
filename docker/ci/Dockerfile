# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
FROM vespabuild

COPY tmp/vespa.spec /vespa.spec
RUN yum-builddep -y /vespa.spec

RUN useradd --create-home -s /bin/bash vespabuilder
WORKDIR /home/vespabuilder
USER vespabuilder

ENV LANG en_US.UTF-8

COPY ci/vespa-ci-internal.sh /vespa-ci-internal.sh
