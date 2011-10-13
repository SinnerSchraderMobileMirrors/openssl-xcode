#!/bin/sh

#
# Abort if anything goes wrong
#
set -e

rm -rf build

xcodebuild -sdk iphoneos5.0 -configuration Release
xcodebuild -sdk iphonesimulator5.0 -configuration Debug

mkdir -p output

lipo -create build/Release-iphoneos/libcrypto.a  -arch i386 build/Debug-iphonesimulator/libcrypto.a -o output/libcrypto_univ.a
lipo -create build/Release-iphoneos/libssl.a  -arch i386 build/Debug-iphonesimulator/libssl.a -o output/libssl_univ.a

