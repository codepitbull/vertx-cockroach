#!/usr/bin/env bash

MACHINE='m1'

if [ $1 == 'clear' ]
then vagrant ssh $MACHINE -c 'bash /shared/clear_net.sh'
fi

if [ $1 == 'delay' ]
then vagrant ssh $MACHINE -c 'bash /shared/slow_net.sh'
fi
