#!/usr/bin/env bash
tc qdisc change dev eth1 root netem loss 1.0%
