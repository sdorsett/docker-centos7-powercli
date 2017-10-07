FROM centos:centos7

MAINTAINER Stan Dorsett <stan.dorsett@gmail.com>

# install curl from source with openssl support
RUN  cd /tmp/ && \
     yum install openssl openssl-devel -y && \
     yum upgrade nss nss-sysinit nss-tools -y && \
     yum groupinstall "Development Tools" -y && \
     curl -sSL -o curl-7.55.1.tar.gz https://curl.haxx.se/download/curl-7.55.1.tar.gz && \
     tar -zxvf curl-7.55.1.tar.gz && \
     cd curl-7.55.1 && \
     ./configure --with-ssl=/usr/bin && \
     make && \
     make install && \
     yum groupremove "Development Tools" -y && \
     yum remove openssl-devel -y && \

     echo '/usr/local/lib' > /etc/ld.so.conf.d/libcurl.conf && ldconfig && \

     cd /tmp/ && \
     yum install libunwind libicu -y && \
     curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=835019 && \
     mkdir -p /opt/dotnet && \
     tar zxf dotnet.tar.gz -C /opt/dotnet && \
     ln -s /opt/dotnet/dotnet /usr/local/bin && \

     yum -y install https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm && \

     cd /tmp/ && \
     curl -sSL -o PowerCLI_Core.zip https://download3.vmware.com/software/vmw-tools/powerclicore/PowerCLI_Core.zip && \
     yum -y install unzip && \
     mkdir -p ~/.local/share/powershell/Modules && \
     unzip PowerCLI_Core.zip && \
     unzip 'PowerCLI.*.zip' -d ~/.local/share/powershell/Modules && \
     rm -rf /tmpm/* && \
     yum remove unzip -y && \
     yum clean all && \
     rm -rf /var/cache/yum && \

     echo -e 'Get-Module -ListAvailable PowerCLI* | Import-Module\n\
Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false | Out-Null'\
>> /opt/microsoft/powershell/6.0.0-alpha.14/profile.ps1
CMD ["powershell"]
