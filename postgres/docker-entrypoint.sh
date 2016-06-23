#!/usr/bin/env bash

if [ "x$1" != "xpostgres" ]; then
    exec $@
    exit $?
fi

test -z $PGDATA && echo "PGDATA was not set" && exit 1
