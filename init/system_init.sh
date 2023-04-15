#!/bin/bash

echo "Partitioning /dev/sdb..."
echo -e "g\nn\n1\n\n\nw" | fdisk /dev/sdb
echo "Partition created on /dev/sdb1."

echo "Formatting /dev/sdb1 with xfs..."
mkfs.xfs -f /dev/sdb1
echo "File system formatted."

mount -t xfs /dev/sdb1 /data

echo "Creating mount point /data..."
mkdir -p /data

echo "Mounting /dev/sdb1 to /data..."
echo "/dev/sdb1 /data xfs defaults 0 0" >> /etc/fstab
mount -a
echo "Disk /dev/sdb1 has been formatted as xfs and mounted to /data."

