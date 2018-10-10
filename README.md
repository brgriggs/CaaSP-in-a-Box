# CaaSP-in-a-Box
A simplified minimum requirements demo install of CaaSP into KVM for test driving.

We will utilize the dnsmasq capabilities in the libvirt network to hanlde the dns and dhcp for the lab environment.

Steps:
1) Define the network with 'virsh net-define caaspnet-dhcp-2.xml'
2) Source the envirnment variables and alias command used to quickly install the VMs with 'source caaspinstRC.sh'
3) Install the Admin node using the alias 'installadmin'. It is not automated however requires entering the desired root password, ntp and smt server addresses. 
4) Manually add host entries to /etc/hosts for the admin and master servers.
5) Login to Velum and prepare the cluster (check the box for installing tiller)
6) Install the master with the alias 'installmaster'
7) Install the first worker with the alias 'installworker1'
8) Install the second worker with the alias 'installworker2'
8) Accept the nodes in Velum and bootstrap the cluster
