#!/usr/bin/env bash
sudo ufw insert 1 deny proto tcp from 192.168.6.7 to any
sudo ufw insert 1 deny out from any to 192.168.6.7
sudo ufw reload
sudo tcpkill -i eth1 port 26257