#!/bin/bash
v_archive=/vagrant/Xilinx_Vivado_SDK_2016.3_1011_1.tar.gz
if [ -e "$v_archive" ]; then
  echo "Installing Vivado from archive. Go grab a coffee..."
  # bash ./Xilinx_Vivado_SDK_2016.2_0605_1_Lin64.bin --target ~/Documents/Xilinx --noexec
  cd /vagrant
  mkdir /vagrant/Xilinx
  tar -xvf Xilinx_Vivado_SDK_2016.3_1011_1.tar.gz -C /vagrant/Xilinx
  cd /vagrant/Xilinx/Xilinx_Vivado_SDK_2016.2_0605_1/
  sudo bash ./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /vagrant/install_scripts/install_config.txt
  cd /vagrant
  sudo rm -rf Xilinx/
  sudo chmod 777 -R /opt/Xilinx
  sudo chmod 777 -R ~/.Xilinx
else
  echo "Can't find the Vivado installer."
fi
