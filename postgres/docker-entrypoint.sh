#!/usr/bin/env bash

test -z $PGDATA && echo "PGDATA was not set" && exit 1
