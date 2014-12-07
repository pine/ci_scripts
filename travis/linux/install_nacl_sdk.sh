#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Arguments error" 1>&2
    echo "Usage: bash install_nacl_sdk.sh pepper_37" 1>&2
    exit 1
fi

sudo apt-get update -qq
sudo apt-get install -qq libc6-i386 lib32gcc1 lib32stdc++6

wget http://storage.googleapis.com/nativeclient-mirror/nacl/nacl_sdk/nacl_sdk.zip
unzip nacl_sdk.zip
cd nacl_sdk

./naclsdk list
./naclsdk update $1

export NACL_SDK_ROOT="$PWD/$1"
echo $NACL_SDK_ROOT
cd ..
