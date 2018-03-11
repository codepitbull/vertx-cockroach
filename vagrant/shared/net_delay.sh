#!/usr/bin/env bash
tc qdisc add dev eth1 root netem delay 100ms
