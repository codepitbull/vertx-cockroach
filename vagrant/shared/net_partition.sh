#!/usr/bin/env bash
sudo ufw deny proto tcp from 192.168.6.7 to any
sudo ufw deny out from any to 192.168.6.7
sudo ufw reload
sudo tcpkill -i eth1 port 26257