#!/bin/sh
device='/dev/loop0'
sizeInMb='512'
dd if=/dev/zero of=/tmp/error.img bs=$sizeInMb count=1048576
losetup $device /tmp/error.img
mkfs.ext4 $device
echo "0 261144 linear /dev/loop0 0\n261144 5 error\n261149 787427 linear $device 261139" | dmsetup create errdev0
mount /dev/mapper/errdev0 /opt/data