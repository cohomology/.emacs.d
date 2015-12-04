#!/bin/bash

pushd third-party/list-utils
make
popd

pushd third-party/loc-changes
./autogen.sh
./configure
make
popd

pushd third-part/load-relative
./autogen.sh
./configure
make 
popd

pushd third-party/realgud
./autogen.sh
./configure
make
popd

pushd third-party/rtags
cmake .
make -j 5
popd
