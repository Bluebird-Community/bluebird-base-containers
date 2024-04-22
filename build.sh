
#!/bin/bash -e

# shellcheck disable=SC2034


# Version information
VERSION="0.13."
BUILD_NUMBER="b1"

GHR_RELEASE_URL="https://github.com/tcnksm/ghr/releases/download/v${VERSION}/ghr_v${VERSION}_linux_amd64.tar.gz"

IMAGE_VERSION="${VERSION}"

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" -o "${CONTAINER_IMAGE}"
