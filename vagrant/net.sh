#!/usr/bin/env bash

MACHINE='m1'

if [ $1 == 'clear' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/net_clear.sh'
fi

if [ $1 == 'delay' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/net_delay.sh'
fi

if [ $1 == 'loss' ]
then vagrant ssh $MACHINE -c 'sudo bash /shared/net_loss.sh'
fi
