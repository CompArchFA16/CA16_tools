# -*- mode: ruby -*-
# vi: set ft=ruby :

# Please install vagrant-vbguest and vagrant-reload first to ensure version
# numbers match for virtualbox guest stuff.

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
vm_name = 'CA_tools'

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest is not installed!'
end
unless Vagrant.has_plugin?("vagrant-reload")
  raise 'vagrant-reload is not installed!'
end

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Unfortunately, Vivado likes to have lots of resources, and we
    # sort of need a gui to install it.
    vb.memory = "4096"
    vb.cpus = "1"
    vb.customize ["modifyvm", :id, "--vram", "128"]

    # If you can't see the FTDI device, add yourself to vboxusers group.
    vb.customize ['modifyvm', :id, '--usbehci', 'on']
    vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'ZyboDebug', '--vendorid', '0x0403', '--productid', '0x6010']
    # vb.customize ['guestproperty', 'set', vm_name, '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold', '1000']
  end

  # Provision the VM to install our software
  config.vm.provision :reload
  config.vm.provision "shell" do |s|
   s.path = "provision.sh"
  end


end
