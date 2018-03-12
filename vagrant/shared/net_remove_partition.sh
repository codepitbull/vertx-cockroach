#!/usr/bin/env bash
sudo ufw delete deny proto tcp from 192.168.6.7 to any
sudo ufw delete deny out from any to 192.168.6.7
sudo ufw reload