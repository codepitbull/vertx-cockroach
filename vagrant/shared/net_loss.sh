#!/usr/bin/env bash
#Lose 1% of incoming packages
tc qdisc change dev eth1 root netem loss 1.0%
