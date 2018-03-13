#!/usr/bin/env bash
ufw delete deny proto tcp from 192.168.6.7 to any
ufw delete deny out from any to 192.168.6.7
ufw reload