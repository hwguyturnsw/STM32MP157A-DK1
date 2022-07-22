#!/bin/bash
#
#Make new release
#2022-ejc-07.22.2022
#
##################################################
#Variables
##################################################
timeanddate=$(date --utc)
builduser=$(whoami)
hostname=$(hostname)
osrelease=$(cat /etc/redhat-release)
kernelversion=$(uname -r)
machineid=$(cat /etc/machine-id)
creation_date=$(date +%m.%d.%Y)
version=$(grep Version ../trunk/buildroot-2022.02.3/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
manifestfile=../../../../releases/stm32_${version}/manifest.txt
checksumsdir=../../../../releases/stm32_${version}/checksums
##################################################
#Make Release Directory and Checksums Directory
##################################################
echo "Making release directory..."
cd ../releases
mkdir stm32_${version}
cd stm32_${version}
mkdir checksums
##################################################
#Creating tar.xz and Signing For Release
##################################################
echo "Creating tar.xz and signing for release..."
cd ../../trunk/buildroot-2022.02.3/output/images
tar -czvf stm32_${version}_${creation_date}_signed.tar.xz *
echo "Signing release tar.xz..."
gpg --detach-sign stm32_*_signed.tar.xz
##################################################
#Make Manifest file.
##################################################
echo "Making Manifest Files and Checksums Files..."
echo "Manifest: $timeanddate" > $manifestfile
echo "" >> $manifestfile
##################################################
#Insert STM32 Version Information
##################################################
echo "**********************" >> $manifestfile
echo "STM32 Version: $version" >> $manifestfile
echo "Build Date $creation_date" >> $manifestfile
echo "**********************" >> $manifestfile
echo "" >> $manifestfile
##################################################
#Insert Build Machine Information
##################################################
echo "ECS Build Machine Information: " >> $manifestfile
echo "***************************************************" >> $manifestfile
echo "Machine ID: $machineid" >> $manifestfile
echo "User and Hostname: $builduser @ $hostname" >> $manifestfile
echo "Date: $timeanddate" >> $manifestfile
echo "RedHat Release Name: $osrelease" >> $manifestfile
echo "Kernel Version: $kernelversion" >> $manifestfile
echo "***************************************************" >> $manifestfile
echo "" >> $manifestfile
##################################################
#Insert File Hashes
##################################################
echo "File Hashes: " >> $manifestfile
echo "***************************************************************************************************************************************************" >> $manifestfile
echo "SHA-256 Hashes: " >> $manifestfile
hashrat -sha256 -t * >> $manifestfile
echo "" >> $manifestfile
echo "SHA-512 Hashes: " >> $manifestfile
hashrat -sha512 -t * >> $manifestfile
echo "" >> $manifestfile
echo "SHA3-512 Hashes: " >> $manifestfile
rhash --sha3-512 * >> $manifestfile
echo "" >> $manifestfile
echo "Whirlpool Hashes: " >> $manifestfile
hashrat -whirlpool -t * >> $manifestfile
echo "" >> $manifestfile
echo "TIGER-192-3 Checksums: " >> $manifestfile
rhash --tiger * >> $manifestfile
echo "***************************************************************************************************************************************************" >> $manifestfile
##################################################
#Hash into separate files with Hashrat
##################################################
echo "Hashing Whirlpool, SHA256 & SHA512..."
hashrat -whirlpool -t * > $checksumsdir/whirlpool-checksums.txt
hashrat -sha256 -t * > $checksumsdir/sha256-checksums.txt
hashrat -sha512 -t * > $checksumsdir/sha512-checksums.txt
##################################################
#Hash into separate files with RHash
##################################################
echo "Hashing SHA3-512, and TIGER..."
rhash --sha3-512 * > $checksumsdir/sha3-512-checksums.txt
rhash --tiger * > $checksumsdir/tiger-192-3-checksums.txt
##################################################
echo "Done Making Manifest and Checksum Files..."
##################################################
#Move signed tar.xz and change directory
##################################################
mv stm32_${version}_${creation_date}_signed* ../../../../releases/stm32_${version}
cd ../../../../releases/stm32_${version}
##################################################
#Sign the manifest
##################################################
echo "Signing manifest..."
gpg --detach-sign manifest.txt
##################################################
#Change Directory and sign the checksum files
##################################################
cd checksums
echo "Signing checksum files..."
gpg --detach-sign whirlpool-checksums.txt
gpg --detach-sign sha256-checksums.txt
gpg --detach-sign sha512-checksums.txt
gpg --detach-sign sha3-512-checksums.txt
gpg --detach-sign tiger-192-3-checksums.txt
echo "Done"