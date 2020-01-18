#! /bin/bash  -xue

boxFile='ubuntu-quantum.box'
boxName='ubuntu-bionic64-quantum'

# Account Name of Vagrant Cloud.
vcUser='takahiro-itou'

pushd  vagrant

vagrant  destroy -f  || exit $?
vagrant  up          || exit $?
vagrant  halt

vagrant  package   --output ../${boxFile}  default

popd

cat  << _EOF_  1>&2
To add package into box list, run:
_EOF_

cat  << _EOF_
vagrant  box  add  --name ${vcUser}/${boxName}  ${boxFile}
_EOF_

cat  << _EOF_
To add package into box list, run:
vagrant box add  --name ubuntu/bionic64-quantum  ubuntu-18.04-quantum.box
_EOF_
