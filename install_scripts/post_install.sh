echo "Setting permissions for Vivado Folders."
chown -R vagrant:vagrant /home/vagrant/Xilinx
chown -R vagrant:vagrant /home/vagrant/.Xilinx

echo "Copying board files."
sudo cp -a /vagrant/vivado-boards/new/board_files/. /home/vagrant/Xilinx/Vivado/2016.3/data/boards/board_files
