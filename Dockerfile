FROM 0x01be/gradle:5.4.1-build as build

FROM alpine

COPY --from=build /opt/gradle/ /opt/gradle/

RUN apk add --no-cache --virtual gradle-runtime-dependencies \
    openjdk8

ENV PATH ${PATH}:/opt/gradle/bin/

