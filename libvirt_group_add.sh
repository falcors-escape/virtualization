#!/bin/bash

virt_group_add(){
	sudo usermod -aG libvirt $USER
}

apply_to_session(){
	newgrp libvirt
}

virt_group_add
apply_to_session
