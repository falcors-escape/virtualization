#!/bin/bash

#define vm parameters and have virt-install handle the disk image instead of using qemu-img

#Fallback to ubuntu 24.04 or generic if exact release isnt in libosinfo yet
OS_VARIANT="ubuntu24.04"

ISO_PATH="/var/lib/libvirt/images/ubuntu-26.10-live-server-amd64.iso"

image_provisioner(){
virt-install \
	--connect qemu:///system \
	--name test-vm \
	--ram 3072 \
	--vcpus 2 \
	--disk size=10,format=qcow2 \
	--os-variant "$OS_VARIANT" \
	--location "$ISO_PATH,kernel=casper/vmlinuz,initrd=casper/initrd" \
	--graphics none \
	--extra-args "console=ttyS0,115200n8 DEBCONF_FRONTEND=text --- console=ttyS0,115200n8"
}

image_provisioner
