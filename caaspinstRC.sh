#!/bin/bash
#################################################################
# caaspinstRC.sh by Brent Griggs V.99 Oct 9 2018		#
# Easily portable RC to source and manage the install of CaaSP	#
# lab envirnonments in KVM.					#
# Example							#
# $ source ./caaspinstRC.sh
# $ installadmin #Unmanaged install of admin node		#
# $ installmaster #automated install of first master node	#
# $ installworker1 #automated install of first worker node	#
# $ installworker2 #automated install of second worker node	#
# $ installworker3 #automated install of third worker node	#
#								#
# Minimum install is 1 master and 2 workers			#
#################################################################
#hostnames
admin=admin
master=master
worker1=worker1
worker2=worker2
worker3=worker3
worker4=worker4
#MacAddresses
adminmac=52:54:00:44:c3:99
mastermac=52:54:00:44:c3:91
worker1mac=52:54:00:44:c3:11
worker2mac=52:54:00:44:c3:12
worker3mac=52:54:00:44:c3:13
worker4mac=52:54:00:44:c3:14
#LabEnvironment
vmname=c3
network=caaspnet
disk=/data/kvm/
dnsdom=suselab.com
caaspiso=/data/iso/SUSE-CaaS-Platform-3.0-DVD-x86_64-GM-DVD1.iso
adminmem=6144
mastermem=8192
workermem=8192


alias installadmin='vm=$vmname$admin; virt-install  --connect qemu:///system --virt-type kvm --vcpus 4 --os-variant sles12sp3 --name $vm --memory $adminmem --disk $disk/$vm.qcow2,bus=virtio,format=qcow2,size=40 --location $caaspiso --graphics vnc --network network=$network,model=virtio,mac=$adminmac --extra-args "netsetup=dhcp hostname=$admin"&'

alias installmaster='vm=$vmname$master;  virt-install  --connect qemu:///system --virt-type kvm --vcpus 4 --os-variant sles12sp3 --name $vm --memory $mastermem --disk $disk/$vm.qcow2,bus=virtio,format=qcow2,size=40 --location $caaspiso --graphics vnc --network network=$network,model=virtio,mac=$mastermac --extra-args "netsetup=dhcp autoyast=http://$admin.$dnsdom/autoyast hostname=$master"&'

alias installworker1='vm=$vmname$worker1;  virt-install  --connect qemu:///system --virt-type kvm --vcpus 4 --os-variant sles12sp3 --name $vm --memory $workermem --disk $disk/$vm.qcow2,bus=virtio,format=qcow2,size=40 --location $caaspiso --graphics vnc --network network=$network,model=virtio,mac=$worker1mac --extra-args "netsetup=dhcp autoyast=http://$admin.$dnsdom/autoyast hostname=$worker1"&'

alias installworker2='vm=$vmname$worker2;  virt-install  --connect qemu:///system --virt-type kvm --vcpus 4 --os-variant sles12sp3 --name $vm --memory $workermem --disk $disk/$vm.qcow2,bus=virtio,format=qcow2,size=40 --location $caaspiso --graphics vnc --network network=$network,model=virtio,mac=$worker2mac --extra-args "netsetup=dhcp autoyast=http://$admin.$dnsdom/autoyast hostname=$worker2"&'

alias installworker3='vm=$vmname$worker3;  virt-install  --connect qemu:///system --virt-type kvm --vcpus 4 --os-variant sles12sp3 --name $vm --memory $workermem --disk $disk/$vm.qcow2,bus=virtio,format=qcow2,size=40 --location $caaspiso --graphics vnc --network network=$network,model=virtio,mac=$worker3mac --extra-args "netsetup=dhcp autoyast=http://$admin.$dnsdom/autoyast hostname=$worker3"&'

alias installworker4='vm=$vmname$worker4;  virt-install  --connect qemu:///system --virt-type kvm --vcpus 4 --os-variant sles12sp3 --name $vm --memory $workermem --disk $disk/$vm.qcow2,bus=virtio,format=qcow2,size=40 --location $caaspiso --graphics vnc --network network=$network,model=virtio,mac=$worker4mac --extra-args "netsetup=dhcp autoyast=http://$admin.$dnsdom/autoyast hostname=$worker4"&'


