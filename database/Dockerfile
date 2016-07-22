FROM postgres:9.5

ENV CONCOURSE_PASSWORD_KEY /tmp/nonexistant
ENV CONCOURES_PASSWORD_FILE /tmp/nonexistant

RUN test -e /tmp/nonexistant && rm -fr /tmp/nonexistant || true
ADD initdb.d/ /docker-entrypoint-initdb.d/
