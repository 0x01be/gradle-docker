FROM 0x01be/gradle:build as build

FROM alpine

COPY --from=build /opt/ /opt/

RUN apk add --no-cache --virtual gradle-runtime-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    openjdk15-jdk

ENV PATH ${PATH}:/opt/gradle/bin/:/opt/groovy/bin/

