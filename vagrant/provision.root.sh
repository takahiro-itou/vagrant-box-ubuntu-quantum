#! /bin/bash  -xue

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  apt  update
sudo  apt  install -y  build-essential
