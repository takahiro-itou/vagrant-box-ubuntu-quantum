#! /bin/bash  -xue

pushd  vagrant

vagrant  destroy -f  || exit $?
vagrant  up          || exit $?
vagrant  halt

vagrant  package   --output ../ubuntu-18.04-quantum.box  default

popd

cat  << _EOF_
To add package into box list, run:
vagrant box add  --name ubuntu/bionic64-quantum  ubuntu-18.04-quantum.box
_EOF_
