#!/usr/bin/env bash

if [ "x$1" != "xpostgres" ]; then
    exec $@
    exit $?
fi

test -z $PGDATA && echo "PGDATA was not set" && exit 1

if [ ! -e $PGDATA ]; then
    mkdir -p $PGDATA
    test $? -ne 0 && exit 1
fi

chown -R postgres:postgres $PGDATA
test $? -ne 0 && exit 1

if [ ! -e $PGDATA/PG_VERSION ]; then
    gosu postgres /usr/pgsql-9.5/bin/initdb    
fi
