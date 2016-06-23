#!/usr/bin/env bash

if [ "x$1" != 'xredis' ]; then
    exec $@
    exit $?
fi

test -z $REDIS_DATA && echo 'REDIS_DATA is not set' && exit 1
if [ ! -e $REDIS_DATA ]; then
    mkdir -p $REDIS_DATA
    test $? -ne 0 && exit 1
fi
chown -R redis:redis $REDIS_DATA
test $? -ne 0 && exit 1

if [ ! -e $REDIS_DATA/redis.conf ]; then
    cp /redis.conf $REDIS_DATA && chown redis:redis $REDIS_DATA/redis.conf
    test $? -ne 0 && exit 1
fi

shift
exec gosu redis redis-server $REDIS_DATA/redis.conf $@
