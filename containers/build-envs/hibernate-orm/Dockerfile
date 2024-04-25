ARG BASE_IMAGE="debian"
ARG BASE_IMAGE_VERSION="bookworm-slim"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="latest"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH
ARG MAVEN_VERSION
ARG MAVEN_MD5_HASH

# Update image
RUN apt-get update && apt-get upgrade -y && apt-get clean

# install dependencies
RUN apt-get update && apt-get install -y wget && apt-get clean

# install java jdk oracle 1.5.0-22
RUN wget --no-cookies --no-check-certificate \
      --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
      https://download.oracle.com/otn/java/jdk/1.5.0_22/jdk-1_5_0_22-linux-amd64.bin -O /tmp/jdk-1_5_0_22-linux-amd64.bin \
    && echo yes | sh /tmp/jdk-1_5_0_22-linux-amd64.bin \
    && mkdir -p /opt/java \
    && mv /jdk1.5.0_22 /opt/java \
    && rm /tmp/jdk-1_5_0_22-linux-amd64.bin

# install java jdk oracle 1.6
RUN wget --no-cookies --no-check-certificate \
      --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
      https://download.oracle.com/otn/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin -O /tmp/jdk-6u45-linux-x64.bin \
    && echo yes | sh /tmp/jdk-6u45-linux-x64.bin \
    && mkdir -p /opt/java \
    && mv /jdk1.6.0_45 /opt/java \
    && rm /tmp/jdk-6u45-linux-x64.bin

# install maven
RUN wget --no-cookies https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -O /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && echo "${MAVEN_MD5_HASH} /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz" | md5sum \
    && tar -xvf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && mkdir -p /opt/maven \
    && mv /apache-maven-${MAVEN_VERSION} /opt/maven \
    && rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# For this we set JDK 1.5. as main java version to use
ENV JAVA_HOME /opt/java/jdk1.5.0_22
ENV PATH="/opt/maven/apache-maven-${MAVEN_VERSION}/bin:/opt/java/jdk1.5.0_22/bin:${PATH}"

RUN ls -l /opt/maven/apache-maven-${MAVEN_VERSION}
RUN ls -l /opt/maven/apache-maven-${MAVEN_VERSION}/bin
RUN java -version
RUN mvn --version

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="Build Env - Hibernate ORM - ${VERSION}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.vendor="Bluebird Community" \
      org.opencontainers.image.authors="Bluebird Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.openns.maven.version="${MAVEN_VERSION}" \
      org.opennms.java.version="oracle-jdk1.5.0_22 (path) & oracle-jdk1.6.0_45 (available via /opt/java)" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"