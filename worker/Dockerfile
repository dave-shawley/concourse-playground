FROM concourse:local

VOLUME /app/work
RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install -y curl iproute2 iptables openssh-client \
 && apt-get clean -y

ADD ./run /app/bin/
RUN chmod a+x /app/bin/*
