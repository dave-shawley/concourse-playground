#!/bin/sh -e
#
if test -n "$CONCOURSE_PASSWORD_HASH"
then
	passwd="'md5$CONCOURSE_PASSWORD_HASH'"
else
	passwd=NULL
fi

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<SQL
CREATE USER concourse WITH
	NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT NOREPLICATION
	LOGIN
	PASSWORD $passwd;
CREATE DATABASE concourse WITH 
	OWNER concourse TEMPLATE template0 ENCODING utf8;
GRANT ALL PRIVILEGES ON DATABASE concourse TO concourse;
SQL
