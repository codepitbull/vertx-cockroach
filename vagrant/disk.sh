#!/usr/bin/env bash

MACHINE='m1'

if [ $1 == 'delay' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/disk_delay.sh'
fi

if [ $1 == 'error' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/disk_error.sh'
fi
