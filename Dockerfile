FROM alpine

ENV GRADLE_VERSION 6.6.1
ENV GROOVY_VERSION 3.0.4
ADD https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip /gradle-${GRADLE_VERSION}.zip
ADD https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-${GROOVY_VERSION}.zip /apache-groovy-binary-${GROOVY_VERSION}.zip

RUN apk add --no-cache --virtual gradle-build-dependencies \
    unzip

RUN unzip /gradle-${GRADLE_VERSION}.zip
RUN unzip /apache-groovy-binary-${GROOVY_VERSION}.zip

RUN mkdir -p /opt/
RUN mv /gradle-${GRADLE_VERSION} /opt/gradle
RUN mv /groovy-${GROOVY_VERSION} /opt/groovy

