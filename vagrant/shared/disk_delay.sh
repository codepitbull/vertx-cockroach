#!/bin/sh
systemctl stop cockroach
device='/dev/ram0'
#create a 128mb RAM disk
modprobe brd rd_nr=1 rd_size=131027
readdelay=10
writedelay=10
size=$(blockdev --getsize $device) # Size in 512-bytes sectors
mkfs.ext4 $device
mount $device /mnt
mv /opt/data/cockroach-data /mnt/
umount /mnt
echo "0 $size delay $device 0 $readdelay $device 0 $writedelay" | dmsetup create delayed
mount /dev/mapper/delayed /opt/data
systemctl start cockroach