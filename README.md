# FPGA Tools
This master branch contains the scripts for generating the vagrant box given
that the relevant installer filers are already downloaded to the machine.

# What you will need
* Virtualbox
* Virtualbox Extensionpack
* Vagrant
  * and plugins vagrant-vbguest and vagrant-reload
* Yourself added to vboxusers group if on Linux.
* Something to do for about an hour.

# What you will need to download into this repo folder
* [Digilent Adept Runtime 64bit .deb](https://reference.digilentinc.com/reference/software/adept/start?redirect=1id=digilent_adept_2#software_downloads)
* [Vivado 2016.3 (the full image, requires registration)](http://www.xilinx.com/support/download.html)
* Both files can be deleted after installation, but will be needed again if you ever `vagrant destroy`

# Getting Started
* Close anything you don't need.
* In this repo's root folder, run `vagrant up`
* After the machine boots and installs some packages through apt, run the install scripts.
  * Vivado install can't be readily automated through the web installer. There's no way to pass login credentials!
  * Install vivado from the web installer first. Choose webpack, and check the box to install SDK. Also change the install path to be under /home/vagrant
  * Run `digilent_tools.sh` afterwards.
  * `chown -R vagrant:vagrant /home/vagrant/Xilinx` and `.Xilinx.`
* Digilent board files are added as a submodule here.

# Running and verifying Vivado installation
* Launch with `start_vivado.sh` in `/vagrant`
* Setting up License
  * [Apparently not necessary anymore (p 75)!](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug973-vivado-release-notes-install-license.pdf)
* Plug the Zybo into the host machine and ensure that it appears when you run `lsusb`

# Troubleshooting
## Can't find the ZYBO board.
* Are you plugged into PROG/UART on the board?
  * Not the micro usb under the USB A.
* Is the board on?
* Can the host machine see the board as a usb device?
* Have you added yourself to vboxusers?
* Does Future Technology Devices International Device appear in lsusb?
* If you open the virtualbox GUI, is the USB controller attached?
