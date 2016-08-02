#!/bin/bash

# This scripts assumes you have...
# -digilent.adept.runtime_2.16.5-amd64.deb
# -Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz
# in the same folder as VagrantFile

echo "Installing system updates."
# This takes a long time, so perhaps we won't need to do this.
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get upgrade

echo "Installing the desktop."
sudo apt-get -y install xubuntu-desktop
# Hack to prevent screen locking in the VM. Send a PR if you know how you're
# supposed to disable light locker via CLI. Screensaver persists...
sudo mv /etc/xdg/autostart/light-locker.desktop /etc/xdg/autostart/light-locker.desktop.bak

echo "Installing system tools."
sudo apt-get -y install git cmake
sudo apt-get -y gcc-arm-none-eabi gdb-arm-none-eabi gcc-arm-linux-gnueabi gcc-multilib
# SDK appears to need these?
sudo apt-get -y install libstdc++6:i386 lib32z1
sudo apt-get -y install python-pip

echo "Installing HDL tools."
sudo apt-get -y install gtkwave
sudo apt-get -y install iverilog
sudo pip install myhdl

adept=/vagrant/digilent.adept.runtime_2.16.5-amd64.deb
if [ ! -e "$adept" ]; then
  echo "Can't find Digilent Adept Runtime .deb file!"
else
  echo "Installing Digilent Adept Runtime."
  dpkg -i /vagrant/digilent.adept.runtime_2.16.5-amd64.deb
  sudo apt-get -y install -f
fi

# This will take a LONG time. It needs to decompress a 12GB archive
# and install a portion of it. It deletes the decompressed files afterwards,
# but if you're really hurting for space you might want to have VirtualBox
# compact the disk image.
v_archive=/vagrant/Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz
if [ ! -e "$v_archive" ]; then
  echo "Can't find Vivado archive! Continuing w/o Vivado..."
else
  echo "Installing Vivado. Go grab a coffee..."
  cd /vagrant
  mkdir /home/vagrant/Xilinx
  tar -xvf Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz -C /home/vagrant/Xilinx
  cd /home/vagrant/Xilinx/Xilinx_Vivado_SDK_2016.2_0605_1/
  sudo bash ./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /vagrant/install_config.txt
  cd /home/vagrant
  sudo rm -rf Xilinx/
  sudo chmod 777 -R /opt/Xilinx
  sudo chmod 777 -R ~/.Xilinx
fi

echo "Getting Digilent Zybo resources from git."
rm -rf /vagrant/resources
mkdir /vagrant/resources
cd /vagrant/resources
git clone https://github.com/Digilent/vivado-boards/
# This will fail if Vivado didn't install, btw.
sudo cp -a /vagrant/resources/vivado-boards/new/board_files/. /opt/Xilinx/Vivado/2016.2/data/boards/board_files
git clone https://github.com/Digilent/ZYBO

echo "Done!"
echo "You can log in with user: vagrant, password: vagrant"
cat /vagrant/provision_helper.txt
