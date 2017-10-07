This repository provides a Dockerfile to create a CentOS 7 docker image with VMware powercli core installed on it.

In order to use this Dockerfile, perform the following steps:
* Install docker 
* Clone this repository using the following command:
```
  git clone https://github.com/sdorsett/docker-centos7-powercli.git
``` 
* Build the docker image by going to the docker-centos7-powercli directory and run the following command to install the necessary componants on top of the centos:centos7 docker image:
```
docker build -t centos7-powercli .
``` 
* Run an instance of the docker image you just built by running the following command:
```
docker run -it centos7-powercli
```
* The new container should immediately drop you into a powershell prompt:
```
Stans-MacBook-Pro-2:~ standorsett$ docker run -it centos7-powercli
PowerShell
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

Loading personal and system profiles took 1622ms.
PS />
```
* You can confirm the powercli modules have been loaded by running the following command:
```
PS /> Get-Module -ListAvailable PowerCLI*


    Directory: /root/.local/share/powershell/Modules


ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Binary     6.0.0.0    PowerCLI.Cis
Binary     1.21       PowerCLI.Vds
Binary     1.21       PowerCLI.ViCore                     HookGetViewAutoCompleter


PS />
```
* Enjoy your new working powercli container:
```
PS /> Connect-VIServer

cmdlet Connect-VIServer at command pipeline position 1
Supply values for the following parameters:
Server: 192.168.1.51

Specify Credential
Please specify server credential
User: administrator@vsphere.local
Password for user administrator@vsphere.local: *********


Name                           Port  User
----                           ----  ----
192.168.1.51                   443   VSPHERE.LOCAL\Administrator


PS /> $vms = Get-VM
PS /> $vms[0] | select *


Name                    : centos7-vagrant
PowerState              : PoweredOn
Notes                   :
Guest                   : centos7-virtualbox:Red Hat Enterprise Linux 7 (64-bit)
NumCpu                  : 2
MemoryMB                : 8096
MemoryGB                : 7.90625
VMHostId                : HostSystem-host-88
VMHost                  : 192.168.1.51
VApp                    :
FolderId                : Folder-group-v52
Folder                  : Deployed
ResourcePoolId          : ResourcePool-resgroup-93
ResourcePool            : Resources
HARestartPriority       : ClusterRestartPriority
HAIsolationResponse     : AsSpecifiedByCluster
DrsAutomationLevel      : AsSpecifiedByCluster
VMSwapfilePolicy        : Inherit
VMResourceConfiguration : CpuShares:Normal/2000 MemShares:Normal/40960
Version                 : v9
PersistentId            : 50105ec3-dd9d-4938-fdf0-399f62f0720a
GuestId                 : rhel7_64Guest
UsedSpaceGB             : 64.614705832675099372863769531
ProvisionedSpaceGB      : 67.301230818964540958404541015
DatastoreIdList         : {Datastore-datastore-89}
ExtensionData           : VMware.Vim.VirtualMachine
CustomFields            : {[vsphere-vps, ]}
Id                      : VirtualMachine-vm-1013
Uid                     : /VIServer=vsphere.local\administrator@192.168.1.100:443/VirtualMachine=VirtualMachine-vm-1013/
Client                  : VMware.VimAutomation.ViCore.Impl.V1.VimClient

PS />
```
