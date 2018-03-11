#!/bin/sh
modprobe brd rd_nr=1 rd_size=1048576
device='/dev/ram0'
readdelay=200
writedelay=500
ls -l $device
size=$(blockdev --getsize $device) # Size in 512-bytes sectors
mkfs.ext4 /dev/ram0
echo "0 $size delay $device 0 $readdelay $device 0 $writedelay" | dmsetup create delayed
mount /dev/mapper/delayed /opt/data
