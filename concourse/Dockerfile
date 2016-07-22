FROM ubuntu:16.04

VOLUME /app/keystore

ADD https://github.com/concourse/concourse/releases/download/v1.4.1/concourse_linux_amd64 /app/bin/
RUN chmod a+x /app/bin/concourse_linux_amd64

CMD "/app/bin/run"
