#!/bin/sh
systemctl stop cockroach
device='/dev/loop0'
#Create device with 128MB
dd if=/dev/zero of=/tmp/error.img bs=512 count=256000
losetup $device /tmp/error.img
mkfs.ext4 $device
#Damage the device, linear-region=ok, error-region=hole, linear-region=ok
echo "0 17 linear $device 0\n17 5 error\n22 255978 linear $device 22" | dmsetup create errdev0
mount /dev/mapper/errdev0 /mnt
mv /opt/data/cockroach-data /mnt/
umount /mnt
mount /dev/mapper/errdev0 /opt/data
systemctl start cockroach