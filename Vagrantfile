# -*- mode: ruby -*-
# vi: set ft=ruby :

######################################################################
# Customisation. Change variables here!
#
# hostonly_network_ip_address: set this to a network that is not used on your machine.
#
hostonly_network_ip_address = "192.168.56.20"
#
# Linux distro
#
linux = "ol76"
#
# virtual machine number of cpus.
#
vm_cpus = "2"
#
# virtual machine memory.
#
vm_memory = "2048"
#
# hostname (without .local)
#
vm_hostname = "oraclexe"
#
# Oracle 18c XE 
oraPass = "manager"
# APEX
apexVer = "19.1"
apexEmail = "ron.ekins@gmail.com"
apexAdmin = "Welcome1"
apexPass = "oracle"
# ORDS
ordsVer = "18.4.0.354.1002"
# Java
jarVer = "11.0.1"
# Tomcat
tomVer = "9.0.19"
tomPass = "manager"
#
######################################################################
#
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

unless Vagrant.has_plugin?("vagrant-reload")
  puts 'Installing vagrant-reload Plugin...'
  system('vagrant plugin install vagrant-reload')
end

unless Vagrant.has_plugin?("vagrant-proxyconf")
  puts 'Installing vagrant-proxyconf Plugin...'
  system('vagrant plugin install vagrant-proxyconf')
end

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ol7-latest"
  config.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
  config.vm.hostname = "#{vm_hostname}.local"  

  # synced_folder is disabled. it requires a kernel module that is specific to a kernel.
  # this module will not be there once the kernel is upgraded.
  config.vm.synced_folder "vagrant", "/vagrant", disabled: false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8443, host: 8443
  config.vm.network "forwarded_port", guest: 1521, host: 1521
  config.vm.network "forwarded_port", guest: 5500, host: 5500


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "#{hostonly_network_ip_address}"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "#{vm_hostname}" 
    vb.memory = "#{vm_memory}"
    vb.cpus = "#{vm_cpus}"
    vb.customize ["modifyvm", :id, "--description", "#{vm_hostname}: #{hostonly_network_ip_address}\nOracle: #{oraPass}\nApex: #{apexPass}\tApex Admin: #{apexAdmin}\tApex Version: #{apexVer}\nORDS Version: #{ordsVer}\nJava: #{jarVer}\nTomcat Version: #{tomVer}\tTomcat: #{tomPass}"]
    vb.customize ["modifyvm", :id, "--nic1", "nat", "--cableconnected1", "on", "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nic2", "hostonly", "--hostonlyadapter2", "vboxnet0", "--cableconnected2", "on", "--nictype2", "virtio"]
  end

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook       = "playbook.yml"
#    ansible.verbose        = "-vvv"
    ansible.version        = "latest"
    ansible.inventory_path = "inventory"
    ansible.install        = true
    ansible.limit          = "all" # or only "nodes" group, etc.
    ansible.extra_vars = {
        oraPass: oraPass,
        apexVer: apexVer,
        apexEmail: apexEmail,
        apexPass: apexPass,
        apexAdmin: apexAdmin,
        ordsVer: ordsVer,
        jarVer: jarVer,
        tomVer: tomVer,
        tomPass: tomPass
    }
  end
end
