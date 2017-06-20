# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
FROM centos:7

RUN yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/g/vespa/vespa/repo/epel-7/group_vespa-vespa-epel-7.repo && \
    yum -y install epel-release && \
    yum -y install centos-release-scl && \
    yum -y install git \
                   maven \
                   ccache \
                   rpm-build \
                   sudo && \
    echo "source /opt/rh/devtoolset-6/enable" > /etc/profile.d/devtoolset-6.sh && \
    echo "*          soft    nproc     32768" > /etc/security/limits.d/90-nproc.conf 

RUN useradd --create-home -s /bin/bash vespabuilder
WORKDIR /home/vespabuilder
USER vespabuilder

ENV LANG en_US.UTF-8

COPY vespa-ci-internal.sh /vespa-ci-internal.sh
