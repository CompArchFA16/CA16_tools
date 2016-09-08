# -*- mode: ruby -*-
# vi: set ft=ruby :

# Please install vagrant-vbguest and vagrant-reload first to ensure version
# numbers match for virtualbox guest stuff.

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
vm_name = 'CA16Tools'

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest is not installed!'
end
unless Vagrant.has_plugin?("vagrant-reload")
  raise 'vagrant-reload is not installed!'
end

Vagrant.configure("2") do |config|
  config.vm.box = "CA16"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Vivado needs a lot of RAM during synthesis.
    # If you're running with many CPU cores, increase CPUs for faster synthesis.
    # Video might lag if you decrease the VRAM too much but I agree 128 is
    # probably excessive.
    vb.memory = "4096"
    vb.cpus = "1"
    vb.customize ["modifyvm", :id, "--vram", "128"]

    # If you can't see the FTDI device, add yourself to vboxusers group.
    # FTDI device should be forwarded as soon as its added.
    # Tell me if this fails on windows.
    vb.customize ['modifyvm', :id, '--usb', 'on']
    vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'ZyboDebug', '--vendorid', '0x0403', '--productid', '0x6010']
    # vb.customize ['guestproperty', 'set', vm_name, '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold', '1000']
  end

  config.vm.provision :reload



end
