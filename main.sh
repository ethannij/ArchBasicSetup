#! /bin/bash
#STEPS
#-create vm
#-create drive
#-add hard disk
#-add install iso and guest additions iso
#-modify vm
#-startvm
#-curl installation script


#script will stop upon error
set -e

#NameVM
echo Enter the desired name for your VirtualBox ArchLinux
read -r VMName
VM=$VMName

#Set Directory
echo set VM directory. Prefferably you Virtualbox VMs folder
read -r Path
Directory=$Path
	mkdir "$Directory/$VMName"
	cd "$Directory/$VMName"


#creating virtual harddisk
echo Input desired size of virtual harddisk MiB
read -r diskSizeInput
diskSize="$(( diskSizeInput ))"
cd "$Directory/$VMName"
VBoxManage createhd --filename "$VM".vdi --size $diskSize

#Register VM
VBoxManage createvm --name "$VM" --ostype "ArchLinux_64" --register

#Adding VDI to VM
VBoxManage storagectl "$VM" --name "SATA Controller" --add sata \
  --controller IntelAHCI

VBoxManage storageattach "$VM" --storagectl "SATA Controller" --port 0 \
  --device 0 --type hdd --medium "$VM".vdi

#Adding GuestAdditions to VM
echo Input Guest Additions ISO directory
read -r ADDDIR
ADD=$ADDDIR
cd "$Directory"

VBoxManage storagectl "$VM" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM" --storagectl "IDE Controller" --port 1 \
 --device 1 --type dvddrive --medium "$ADD"

#Adding ISO to VM
echo Input Installation ISO directory
read -r ISODIR
ISO=$ISODIR
cd "$Directory"

VBoxManage storageattach "$VM" --storagectl "IDE Controller" --port 0 \
  --device 0 --type dvddrive --medium "$ISO"

#Additional Configuration
VBoxManage modifyvm "$VM" --ioapic on
VBoxManage modifyvm "$VM" --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm "$VM" --memory 1024 --vram 128
VBoxManage modifyvm "$VM" --firmware efi
VBoxManage modifyvm "$VM" --ioapic on
 
#Booting VM
VBoxManage startvm "$VM"

#Curl Install Script
