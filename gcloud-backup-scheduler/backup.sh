#!/bin/bash

TIMESTAMP=$(date +%Y%m%d)
declare -a disks=("td-disk-1" "td-disk-2" "td-disk-3")

disk_arg=""
snap_arg=""
for disk in "${disks[@]}"
do
    disk_arg=$disk_arg" "$disk
    snap_arg=$snap_arg" "$disk"_"$TIMESTAMP
done
echo $disk_arg
echo $snap_arg

#flush disk buffers
sudo sync

#create disk snapshot
gcloud compute disks snapshot $disk_arg --snapshot-name $snap_arg
