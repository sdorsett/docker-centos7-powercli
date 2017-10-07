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
