#!/bin/bash
if [ ! -f cockroach.tgz ]; then
  wget https://binaries.cockroachdb.com/cockroach-v1.1.5.linux-amd64.tgz 
fi
vagrant up
