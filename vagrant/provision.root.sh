#! /bin/bash  -xue

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  apt  update
sudo  apt  install -y  build-essential      \
    emacs  git  mercurial

# Install .Net Core SDK
wget  -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb  \
    -O packages-microsoft-prod.deb
sudo  dpkg  -i packages-microsoft-prod.deb

sudo  apt  update
sudo  apt  install -y    \
    apt-transport-https  \
    dotnet-sdk-3.1

# clean up
sudo  rm -f  /var/lib/apt/lists/lock
sudo  rm -f  /var/cache/apt/archives/lock
sudo  rm -f  /var/lib/dpkg/lock
