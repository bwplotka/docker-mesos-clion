#!/bin/bash

# Build script inserted in
# source /root/.bashrc

if [ "ac" = "ac" ]
  then
## AUTOMAKE

cd /mesos

./bootstrap
mkdir -p build
cd build
../configure --disable-java --disable-optimize --without-included-zookeeper --with-glog=/usr/local --with-protobuf=/usr --with-boost=/usr/local
make -j 8

#make test

else
## CMAKE

cd /mesos
cmake .
cd build
make -j 8

fi

