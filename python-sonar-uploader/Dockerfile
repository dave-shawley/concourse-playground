FROM java:8-alpine

ENV SONAR_SCANNER_VERSION=2.6.1 \
    SONAR_PROJECT_KEY= \
    SONAR_PROJECT_NAME= \
    SONAR_PROJECT_VERSION= \
    SONAR_URL= \
    SONAR_XUNIT_XML=/build/nosetests.xml \
    SONAR_COVERAGE_XML=/build/coverage.xml \
    SONAR_SOURCE_DIR=/source

VOLUME /build
VOLUME /project
VOLUME /source

RUN set -x \
 && apk add --update python3 sed \
 && apk add --no-cache --virtual .deps gnupg unzip curl \
 && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE \
 && cd /tmp \
 && curl -fSLo scanner.zip https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VERSION.zip \
 && curl -fSLo scanner.zip.asc https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VERSION.zip.asc \
 && gpg --batch --verify scanner.zip.asc scanner.zip \
 && unzip scanner.zip \
 && mv sonar-scanner-$SONAR_SCANNER_VERSION /app \
 && rm -f /tmp/scanner.zip /tmp/scanner.zip.asc \
 && apk del --purge --virtual .deps

COPY run /app/run
RUN chmod u+x /app/run
CMD ["/app/run"]
