ARG BASE_IMAGE="antora/antora"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="latest"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

RUN apk --no-cache add bash make git openssh-client && \
    yarn global add --ignore-optional --silent "https://gitlab.com/antora/xref-validator/-/archive/main/xref-validator-main.tar.gz" && \
    yarn global add --ignore-optional --silent "https://github.com/opennms-forge/antora-lunr-extension#aebcab8142e0b1f8b44bfc85b189af7d3abe9662"

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="Antora ${VERSION}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.vendor="Bluebird Community" \
      org.opencontainers.image.authors="Bluebird Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"