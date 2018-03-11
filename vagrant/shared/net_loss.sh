#!/usr/bin/env bash
sudo tc qdisc change dev eth1 root netem loss 1.0%
