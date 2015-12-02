#!/bin/bash

pushd third-party/realgud
./autogen.sh
./configure
make
popd

pushd third-party/rtags
cmake .
make -j 5
popd
