#!/usr/bin/env bash

function check {
    if [ "x$BOOTSTRAP_EXPECT" == "x" ]; then
        echo "BOOTSTRAP_EXPECT must be set"
        exit 1
    fi
}

function check_master {
    if [ "x$BOOTSTRAP_ADDRESSES" == "x" ]; then
        echo "BOOTSTRAP_ADDRESSES must be set"
        exit 11
    fi
}

function wait_for {
    until $(curl --output /dev/null --silent --head --fail $1:8500); do
        sleep 1
    done
    echo "Done waiting for $1"
}

function start_consul {
    /consul agent -server -data-dir="/data/consul" -client=0.0.0.0 -bootstrap-expect $BOOTSTRAP_EXPECT
}

function join_consul {
    for node in $BOOTSTRAP_ADDRESSES; do
        wait_for $node
    done
    /consul join $BOOTSTRAP_ADDRESSES
}

case "x$RUN_MODE" in
    "xmaster")
        check
        check_master
        join_consul &
        start_consul
        ;;
    "xnode")
        check
        start_consul
        ;;
    *)
        /consul agent -dev -client=0.0.0.0
        ;;
esac
