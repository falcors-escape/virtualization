#!/bin/bash

VM_NAME="test-vm"

vm_deprovisioner(){

	echo "Stopping and deleting $VM_NAME from system daemon..."

	sudo virsh destroy "$VM_NAME" 2>/dev/null
	sudo virsh undefine "$VM_NAME" --remove-all-storage 2>/dev/null

	if ! sudo virsh list --all | grep -q "$VM_NAME"; then
		echo "[SUCCESS] Domain $VM_NAME and associated storage removed."
	else
		echo "[ERROR] Failed to completely remove $VM_NAME."
		return 1
	fi
}

vm_deprovisioner
