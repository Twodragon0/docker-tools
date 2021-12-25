#!/bin/bash

set -euox

: "${IMAGE}"
: "${IMAGE_ID}"
: "${TAG_VERSION_DATE}"
: "${TAG_VERSION_SHA}"
: "${IMAGE_VERSION:-latest}"

echo "push version ${IMAGE_ID}:latest"
docker tag "${IMAGE}" "${IMAGE_ID}:latest"
docker push "${IMAGE_ID}:latest"

echo "push version ${IMAGE_ID}:${TAG_VERSION_DATE}"
docker tag "${IMAGE}" "${IMAGE_ID}:${TAG_VERSION_DATE}"
docker push "${IMAGE_ID}:${TAG_VERSION_DATE}"

echo "push version ${IMAGE_ID}:${TAG_VERSION_SHA}"

docker tag "${IMAGE}" "${IMAGE_ID}:${TAG_VERSION_SHA}"
docker push "${IMAGE_ID}:${TAG_VERSION_SHA}"

if [ "$IMAGE_VERSION" != "latest" ]; then
  echo "push version ${IMAGE_ID}:${IMAGE_VERSION}"
  docker tag "${IMAGE}" "${IMAGE_ID}:${IMAGE_VERSION}"
  docker push "${IMAGE_ID}:${IMAGE_VERSION}"
fi
