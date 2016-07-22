#!/bin/sh
#

openssl req -nodes -newkey rsa:2048 -x509 \
	-keyout $PGDATA/server.key -out $PGDATA/server.crt \
	-days 365  -subj '/C=US'
chown postgres $PGDATA/server.crt $PGDATA/server.key
chmod 0600 $PGDATA/server.key
echo 'ssl = on' >> $PGDATA/postgresql.conf
