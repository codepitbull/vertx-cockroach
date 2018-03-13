#!/usr/bin/env bash
#Config using FIFO adding a fixed delay of 100ms
tc qdisc add dev eth1 root netem delay 100ms
