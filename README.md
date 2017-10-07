This repository provides a Dockerfile to create a CentOS 7 docker image with VMware powercli core installed on it.

In order to use this repository you need the following:
* Install docker 
```
* Clone down this repository using the following command:
```
  git clone https://github.com/sdorsett/docker-centos7-powercli.git
``` 
* Change into the docker-centos7-powercli directory and run the following command to install the necessary componants on top of the centos:centos7 docker image:
```
docker build -t centos7-powercli .
``` 
* Once the new docker image is built run the following command to run an instance of it:
```
docker run -it centos7-powercli
```
A new instance of the centos7-powercli container you build should start up and you should be dropped into a powershell from the beginning:
```
Stans-MacBook-Pro-2:~ standorsett$ docker run -it centos7-powercli
PowerShell
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

Loading personal and system profiles took 1622ms.
PS />
```
You can confirm the powercli modules have been loaded by running the following command:
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
