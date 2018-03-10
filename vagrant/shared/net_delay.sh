#!/usr/bin/env bash
sudo tc qdisc add dev eth1 root netem delay 100ms
