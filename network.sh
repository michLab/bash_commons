#!/bin/bash

function is_port_open() {
    local -r p=$1
    res=$(netstat -ntpl 2>>/dev/null | grep -ia -e $p)
    if test -z "$res"
    then
        return 0
    else
        return 1
    fi
}

function wait_for_port() {
    local -r p=$1
    
    echo "Waiting for port $p"
    local res=0
    while [[ $res == 0 ]];
    do
        sleep 1
        is_port_open $p
        res=$?
    done
    echo "Port $p is opened"
}

function wait_for_site() {
    local -r site=$1
    echo "Waiting for website $site"
    until $(curl --output /dev/null --silent --head --fail $site); do
        printf '.'
        sleep 5
    done
}