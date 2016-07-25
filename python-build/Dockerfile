FROM alpine:3.4
MAINTAINER Dave Shawley <daveshawley@gmail.com>
ENV PYTHON_BUILD_SOURCE=/source \
    PYTHON_BUILD_OUTPUT=/output \
    PYTHON_BUILD_PYTHON=python3 \
    PYTHON_BUILD_ADDITIONAL_PACKAGES=
VOLUME /source
VOLUME /output
RUN apk --no-cache add python py-pip python3 ca-certificates
COPY bootstrap build-dist build-docs run-tests /app/
RUN chmod u+x /app/*
