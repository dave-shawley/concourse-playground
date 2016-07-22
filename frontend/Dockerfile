FROM alpine:3.4
EXPOSE 80
EXPOSE 2222
EXPOSE 8080
EXPOSE 8181
RUN apk --no-cache add haproxy
COPY run /
CMD ["/bin/sh", "-e", "/run"]
