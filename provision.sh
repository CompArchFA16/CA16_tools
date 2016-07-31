# Need to install...
# -Vivado
# -Digilent Adept
# -Icarus
# -Git
# This installer assumes

echo "Installing system updates."
sudo apt-get update
sudo apt-get upgrade

echo "Installing the desktop."
# I'm still looking into CLI installing Vivado, but until then we
# need a desktop.
sudo apt-get -y install gnome-desktop

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

echo "Cleaning up and starting Desktop!"
sudo apt-get -y autoremove
startx
