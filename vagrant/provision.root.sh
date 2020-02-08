#! /bin/bash  -xue

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  apt  update

export DEBIAN_FRONTEND=noninteractive
sudo  -E  apt  install -y  libssl1.1

sudo  apt  install -y  build-essential                          \
    emacs  git  mercurial  make  time  sudo                     \
    language-pack-ja-base  language-pack-ja                     \
    fcitx  fcitx-mozc  ibus-mozc

# Install .Net Core SDK
wget  -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb  \
    -O packages-microsoft-prod.deb
sudo  dpkg  -i packages-microsoft-prod.deb

sudo  apt  update
sudo  apt  install -y    \
    apt-transport-https  \
    dotnet-sdk-3.1

# clean up
sudo  apt  -y  --purge  autoremove
sudo  apt  autoclean
sudo  apt  clean

sudo  rm -f  /var/lib/apt/lists/lock
sudo  rm -f  /var/cache/apt/archives/lock
sudo  rm -f  /var/lib/dpkg/lock

sudo  rm  -rf  /tmp/*
sudo  dd  if=/dev/zero  of=zero  bs=4k  || :
sudo  rm  -f   zero

history  -c
