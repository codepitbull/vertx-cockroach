#!/usr/bin/env bash
if [ "$#" -eq 0 ]; then
    echo "Use like this: ./transfer_cockroach.sh <cleandevice> <manipulateddevice>" >&2
    exit 1
fi
cleandevice=$1
manipulateddevice=$2
systemctl stop cockroach
mount $cleandevice /mnt
mv /opt/data/cockroach-data /mnt/
umount /mnt
mount /dev/mapper/$manipulateddevice /opt/data
systemctl start cockroach