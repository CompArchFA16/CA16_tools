#!/bin/bash
v_archive=/vagrant/Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz
v_web=/vagrant/Xilinx_Vivado_SDK_2016.2_0605_1_Lin64.bin
if [ -e "$v_archive" ]; then
  echo "Installing Vivado from archive. Go grab a coffee..."
  # bash ./Xilinx_Vivado_SDK_2016.2_0605_1_Lin64.bin --target ~/Documents/Xilinx --noexec
  cd /vagrant
  mkdir /vagrant/Xilinx
  tar -xvf Xilinx_Vivado_SDK_2016.2_0605_1.tar.gz -C /vagrant/Xilinx
  cd /vagrant/Xilinx/Xilinx_Vivado_SDK_2016.2_0605_1/
  sudo bash ./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /vagrant/install_config.txt
  cd /vagrant
  sudo rm -rf Xilinx/
  sudo chmod 777 -R /opt/Xilinx
  sudo chmod 777 -R ~/.Xilinx
elif [ -e "$v_web" ]; then
  echo "I detected the Vivado Web installer. You can install this manually once the machine boots."
  echo "It will require your Xilinx account credentials."
else
  echo "Can't find any Vivado installers."
fi
