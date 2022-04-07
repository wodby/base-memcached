#!/bin/bash

set -e

cp alpine/Dockerfile alpine/Dockerfile.wodby

# Change basic image.
sed -i '/FROM alpine/i\ARG BASE_IMAGE_TAG\n' alpine/Dockerfile.wodby
sed -i 's/FROM alpine.*/FROM wodby\/alpine:${BASE_IMAGE_TAG}/' alpine/Dockerfile.wodby

fullVersion=$(grep -oP '(?<=^ENV MEMCACHED_VERSION )([0-9\.]+)' alpine/Dockerfile.wodby)
minorVersion=$(echo "${fullVersion}" | grep -oE '^[0-9]+\.[0-9]+')

# Update workflows.
sed -i -E "s/(MEMCACHED${minorVersion//\./}): '${minorVersion//\./\\.}\.[0-9]+'/\1: '${fullVersion}'/" .github/workflows/workflow.yml
# Update README.
sed -i -E "s/\`${minorVersion//\./\\.}\.[0-9]+\`/\`${fullVersion}\`/g" README.md
