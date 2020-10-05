FROM alpine

ENV GRADLE_VERSION 6.6.1
ADD https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip /gradle-${GRADLE_VERSION}.zip

RUN apk add --no-cache --virtual gradle-build-dependencies \
    unzip

RUN unzip /gradle-${GRADLE_VERSION}.zip

RUN mkdir -p /opt/gradle
RUN mv /gradle-${GRADLE_VERSION}/* /opt/gradle/

