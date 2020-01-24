#!/bin/bash

set -e

SOLR_VERSION=6.6.6

if [ -z "${BACKGROUND_SOLR}" ]; then
    ARGS=""
else
    ARGS="-d"
fi

docker run ${ARGS} -p 9001:8983 -v $PWD/solr-setup.sh:/solr-setup.sh -v $PWD/confdir:/confdir:ro solr:${SOLR_VERSION}-slim bash -c "/solr-setup.sh"
