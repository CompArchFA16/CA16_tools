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

echo "Installing build tools."
sudo apt-get -y install git cmake
sudo apt-get -y gcc-arm-none-eabi gdb-arm-none-eabi gcc-arm-linux-gnueabi gcc-multilib
# Vivado needs these but doesn't check for dependencies when it installs. :/
sudo apt-get -y install libstdc++6:i386 libgtk2.0-0:i386 dpkg-dev:i386

echo "Installing Icarus Verilog & GTK Wave."
sudo apt-get -y install gtkwave
sudo apt-get -y install iverilog

echo "Installing Digilent Drivers."
cd /vagrant
dpkg -i digilent.adept.runtime_2.16.5-amd64.deb
sudo apt-get -y install -f

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

echo "Getting Digilent Zybo resources from git."
rm -rf /vagrant/resources
mkdir /vagrant/resources
cd /vagrant/resources
git clone https://github.com/Digilent/vivado-boards/
sudo cp -a /vagrant/resources/vivado-boards/new/board_files/. /opt/Xilinx/Vivado/2016.2/data/boards/board_files
git clone https://github.com/Digilent/ZYBO

echo "Done!"
echo "You can log in with user: vagrant, password: vagrant"
