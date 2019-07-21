#! /bin/bash  -xue

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  apt  update
sudo  apt  install -y  build-essential

# Install .Net Core SDK
wget  -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb  \
    -O packages-microsoft-prod.deb
sudo  dpkg  -i packages-microsoft-prod.deb

sudo  apt  update
sudo  apt  install -y    \
    apt-transport-https  \
    dotnet-sdk-2.2
