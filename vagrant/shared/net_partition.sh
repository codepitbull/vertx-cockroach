#!/usr/bin/env bash
ufw insert 1 deny proto tcp from 192.168.6.7 to any
ufw insert 1 deny out from any to 192.168.6.7
ufw reload
#kill existing connections for port 26257 => KILLS ALL CONNECTIONS!
tcpkill -i eth1 port 26257