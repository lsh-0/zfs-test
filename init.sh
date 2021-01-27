#!/bin/bash
set -euo pipefail

volsize=8192 # 8 GiB in MiB

echo "--- creating disks"
mkdir -p ./disks
for i in {1..4}; do
    filename="./disks/disk$i.vdi"
    if [ -f "$filename" ]; then
        echo "$filename exists"
    else
        # dynamically allocated
        vboxmanage createmedium disk \
            --filename "$filename" \
            --size "$volsize" \
            --format VDI
    fi
done

echo "--- stopping vagrant. can't attach volumes to running vm."
vagrant halt

echo "--- attaching disks to VM"
vmid=$(cat ".vagrant/machines/zfs-test/virtualbox/id")

attach() {
    disk="$1"
    port="$2"
    device="$3"
    
    filename="./disks/disk$disk.vdi"
    vboxmanage storageattach "$vmid" \
        --storagectl "SATA Controller" \
        --port "$port" \
        --device "$device" \
        --type hdd \
        --medium "$filename"
}

attach 1 1 0
attach 2 2 0
attach 3 3 0
attach 4 4 0

echo "--- starting vagrant"
vagrant up
