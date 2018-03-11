#!/bin/sh
sizeInMb='512'
dd if=/dev/zero of=/tmp/error.img bs=$sizeInMb count=1048576
losetup /dev/loop0 /tmp/error.img
mkfs.ext4 /dev/loop0
echo '0 261144 linear /dev/loop0 0\n261144 5 error\n261149 787427 linear /dev/loop0 261139' | dmsetup create errdev0

