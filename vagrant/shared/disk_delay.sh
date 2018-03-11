#!/bin/sh
device='/dev/ram0'
modprobe brd rd_nr=1 rd_size=1048576
readdelay=200
writedelay=500
ls -l $device
size=$(blockdev --getsize $device) # Size in 512-bytes sectors
mkfs.ext4 $device
echo "0 $size delay $device 0 $readdelay $device 0 $writedelay" | dmsetup create delayed
mount /dev/mapper/delayed /opt/data