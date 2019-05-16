# oracle18xe-ords-apex
Fully automated Vagrant build using VirtualBox and the Ansible provider for Oracle 18xe, Oracle REST Data Services (ORDS), Application Express (APEX) with Apache Tomcat 

# Pre-Requisites
This Vagrant build requires Vagrant and VirtualBox to be pre-installed, this build was tested with Vagrant 2.2.4 & VirtualBox 6.0.4

You can check your version of [Vagrant](https://www.vagrantup.com/) using:
```
$ vagrant version
Installed Version: 2.2.4
Latest Version: 2.2.4
 
You're running an up-to-date version of Vagrant!
```
And for [Oracle VirtualBox](https://www.virtualbox.org/) use:
```
$ vboxmanage --version
6.0.4r128413
```
## Oracle Technology Network (OTN) Downloads
Please note you will need an Oracle SSO account to download software from OTN. 
* [Oracle REST Data Services (ORDS)](https://www.oracle.com/database/technologies/appdev/rest.html)
  * Version used 18.4.0.354.100
* [Oracle Application Express (APEX)](https://www.oracle.com/database/technologies/appdev/apex.html)
  * Version used 19.1 
* [Oracle 18xe (Express Edition)](https://www.oracle.com/database/technologies/appdev/xe/quickstart.html)
  * Version used 18c-1.0-1
## Non-Oracle Downloads
* [Apache Tomcat 9](http://tomcat.apache.org/)
  * Version used 9.0.19
* [OpenJDK 11](https://jdk.java.net/archive/)
  * Version used 11.0.1
  
# Getting Started
1. Clone GitHub
1. Copy downloaded files into vagrant directory
1. Edit Vagrantfile variables e.g.
   ### Host
   * hostonly_network_ip_address = ""
   * vm_hostname
   ### APEX
   * apexVer = "19.1"
   * apexEmail = "john.smith@gmail.com"
   * apexAdmin = "Welcome1"
   * apexPass = "oracle"
   ###O RDS
   * ordsVer = "18.4.0.354.1002"
   ### Java
   * jarVer = "11.0.1"
   ### Tomcat
   * tomVer = "9.0.19"
   * tomPass = "manager"
1. type vagrant up

Now sit back and watch Vagrant, VirtualBox and Ansible do it's magic.

```
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ol7-latest'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: oraclexe
==> default: Clearing any previously set network interfaces...
...
```

