# This scripts assumes you have...
# -digilent.adept.runtime_2.16.5-amd64.deb
# -Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz
# in the same folder as VagrantFile

echo "Installing system updates."
sudo apt-get update
sudo apt-get upgrade

echo "Installing the desktop."
# I'm still looking into CLI installing Vivado, but until then we
# need a desktop.
sudo apt-get -y install xubuntu-desktop

echo "Installing packages needed for build."
sudo apt-get -y install git
sudo apt-get -y install cmake

echo "Installing Icarus Verilog & GTK Wave."
sudo apt-get -y install gtkwave
sudo apt-get -y install iverilog

echo "Installing Digilent Drivers."
cd /vagrant
dpkg -i digilent.adept.runtime_2.16.5-amd64.deb
sudo apt-get -y install -f

echo "Installing Vivado. Go grab a coffee..."
cd /vagrant
# bash ./Xilinx_Vivado_SDK_2016.2_0605_1_Lin64.bin --target ~/Documents/Xilinx --noexec
mkdir /home/vagrant/Xilinx
tar -xvf Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz -C /home/vagrant/Xilinx
cd /home/vagrant/Xilinx/Xilinx_Vivado_SDK_2016.2_0605_1/
sudo bash ./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /vagrant/install_config.txt
cd /home/vagrant
sudo rm -rf Xilinx/

echo "Cleaning up and starting Desktop!"
sudo apt-get -y autoremove
