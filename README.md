# HDL Tools
This repo contains a vagrant box to bring up Verilog tools and Vivado into a
working development environment that can connect to and program Digilent boards.

# What you will need
* 16GB of free disk space.
  * About 8GB can be reclaimed after install.
* Virtualbox
  * `# apt-get install virtualbox`
  * `# apt-get install virtualbox-guest-additions-iso`
* Oracle VM Virtualbox Extension Pack
  * Download from [here](https://www.virtualbox.org/wiki/Downloads), and make sure the version downloaded matches your Virtualbox version.
  * You will most likely need to [download an older version](https://www.virtualbox.org/wiki/Download_Old_Builds), as the version of virtualbox in apt repos is old.
  * Then, `vboxmanage extpack install --replace /path/to/ext-pack` or open the gui and go to File>Preferences>Extensions, click the square with the yellow triangle, and find the file.
  * If you ever update Virtualbox, you will need to update the extensionpack to match it.
* Vagrant
  * and plugins vagrant-vbguest and vagrant-reload
  * `vagrant plugin install vagrant-vbguest`
  * `vagrant plugin install vagrant-reload`
* Yourself added to `vboxusers` group if on Linux.
  * `# usermod -aG vboxusers $USER`
  * Sign out and then back in.
  * Check by typing `groups`
* Patience.

# What you will need to move into this repo folder
* CA16.box, which you'll (soon) be able to find on public, or get from a TA.

# Getting Started
* Close anything you don't need,
* In this repo's root folder, run `vagrant box add CA16 CA16.box`
  * This will take awhile, the box is pretty large.
* Run `vagrant up`. The first time this command is issued will also take awhile.
* When the desktop boots login as user `vagrant` with password `vagrant`
* The folder with Vagrantfile in it (this one) will be shared to the VM at `/vagrant`
* To poweroff, run `vagrant halt` in this directory.
* To remove the machine completely and reclaim disk space run `vagrant destroy`
  * And you'll want to delete ~/.vagrant.d/boxes/CA16 if you're really trying to forget Comp Arch ever existed at the end of the semester.

# Running and verifying Vivado installation
* Launch with `bash ./start_vivado.sh` in `/vagrant`
  * Be careful, it's `/vagrant` NOT `/home/vagrant/`
* Setting up License
  * [Apparently not necessary anymore (p 75)!](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug973-vivado-release-notes-install-license.pdf)
* Plug the Zybo into the host machine and ensure that it appears when you run `lsusb` in the VM, or open Vivado in the VM and try to connect in hardware manager.

# Tips
## Can't find the ZYBO board.
* Are you plugged into PROG/UART on the board?
  * Not the micro under the USB A.
* Is the board on?
* Can the host machine see the board as a usb device?
* Have you added yourself to vboxusers?
* Does Future Technology Devices International Device appear in lsusb?
* If you open the virtualbox GUI, is the USB controller attached?

## Synthesis/Implementation is REALLY slow.
* Edit `Vagrantfile` and give the machine more memory or CPUs.
* This process is naturally not very fast to begin with.
