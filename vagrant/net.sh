#!/usr/bin/env bash

MACHINE='m1'

if [ "$#" -eq 0 ]; then
    echo "Use like this: ./net.sh <scenario> <machine: optional, default is m1>" >&2
    exit 1
fi

if [ "$#" -eq 2 ]; then
    MACHINE=$2
fi

if [ $1 == 'clear' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/net_clear.sh'
fi

if [ $1 == 'delay' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/net_delay.sh'
fi

if [ $1 == 'loss' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/net_loss.sh'
fi
