FROM sonarqube:5.6-alpine
RUN mkdir -p $SONARQUBE_HOME/extensions/plugins
ADD https://sonarsource.bintray.com/Distribution/sonar-python-plugin/sonar-python-plugin-1.6.jar $SONARQUBE_HOME/extensions/plugins
