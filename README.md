# HDL Tools
This repo contains a vagrant box to bring up Verilog tools and Vivado into a
working development environment that can connect to and program Digilent boards.

# What you will need
* 40 GB of free disk space.
  * The image actually gets very close to this size, but can be compacted later.
* Virtualbox
* Virtualbox Extensionpack
* Vagrant
  * and plugins vagrant-vbguest and vagrant-reload
* Yourself added to vboxusers group if on Linux.
* Something to do for about an hour.

# What you will need to download into this repo folder
* [Digilent Adept Runtime 64bit .deb](https://reference.digilentinc.com/reference/software/adept/start?redirect=1id=digilent_adept_2#software_downloads)
* [Vivado 2016.2 (the full image, requires registration)](http://www.xilinx.com/support/download.html)
* Both files can be deleted after installation, but will be needed again if you ever `vagrant destroy`

# Getting Started
* Close anything you don't need,
* In this repo's root folder, run `vagrant up`
  * This will take awhile, especially when installing Vivado.
* That should be all you need to do!

# Running and verifying Vivado installation
* Launch with `start_vivado.sh` in `/vagrant`
* Setting up License
  * [Apparently not necessary anymore (p 75)!](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug973-vivado-release-notes-install-license.pdf)
* Plug the Zybo into the host machine and ensure that it appears when you run `lsusb`
* Load example code to FPGA (Coming soon) with Vivado GUI
  * Maybe I'll make a script that attempts to build and load a project w/ tcl scripts.

# Troubleshooting
## Can't find the ZYBO board.
* Are you plugged into PROG/UART on the board?
  * Not the micro usb under the USB A.
* Is the board on?
* Can the host machine see the board as a usb device?
* Have you added yourself to vboxusers?
* Does Future Technology Devices International Device appear in lsusb?
* If you open the virtualbox GUI, is the USB controller attached?
