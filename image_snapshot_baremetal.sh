#!/bin/bash

###
# Please source your credential file before running this script.
# This scaript will create a clone image of your openstack baremetal instance.
# Usage: sudo sh image_snapshot_baremetal.sh
# Script will ask for image name.
###

# Request image name
echo "Please enter the name of the Image: "
read IMAGE_NAME
export OS_IMAGE_NAME=$IMAGE_NAME

# Install dependencies
sudo apt-get install libguestfs-tools

# Start the image creation process
sudo tar cf /tmp/snapshot.tar / --selinux --acls --xattrs --numeric-owner --one-file-system --exclude=/tmp/* --exclude=/proc/* --exclude=/boot/extlinux
sudo virt-make-fs --partition --format=qcow2 --type=ext4 --label=`ls /dev/disk/by-label` /tmp/snapshot.tar /tmp/snapshot.qcow2
sudo update-guestfs-appliance
sudo guestfish -a /tmp/snapshot.qcow2 -i sh 'grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg'
sudo virt-sysprep -a /tmp/snapshot.qcow2
sudo qemu-img convert /tmp/snapshot.qcow2 -O qcow2 /tmp/snapshot_compressed.qcow2 -c

#Create and upload the image with the given name
glance image-create --name $OS_IMAGE_NAME --disk-format qcow2 --container-format bare < /tmp/snapshot_compressed.qcow2
