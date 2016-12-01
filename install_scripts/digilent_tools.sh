# Digilent Cable drivers. Maybe wget this file?
adept=/vagrant/digilent.adept.runtime_2.16.5-amd64.deb
if [ ! -e "$adept" ]; then
  echo "Can't find Digilent Adept Runtime .deb file!"
else
  echo "Installing Digilent Adept Runtime."
  dpkg -i /vagrant/digilent.adept.runtime_2.16.5-amd64.deb
  sudo apt-get -y install -f
fi

echo "Getting Digilent Zybo resources from git."
rm -rf /vagrant/resources
mkdir /vagrant/resources
cd /vagrant/resources
git clone https://github.com/Digilent/vivado-boards/
# This will fail if Vivado didn't install, btw.
sudo cp -a /vagrant/resources/vivado-boards/new/board_files/. /opt/Xilinx/Vivado/2016.2/data/boards/board_files
