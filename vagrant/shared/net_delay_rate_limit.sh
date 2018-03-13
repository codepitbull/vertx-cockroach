#!/usr/bin/env bash
#Config using token bucket filter, bucket size 900 bytes
tc qdisc add dev eth1 root tbf rate 16kbit latency 20ms burst 900
