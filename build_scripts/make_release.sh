#!/bin/bash
#
#Make new release
#ejc-07.27.2022
#Last updated: 01.06.2024
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
version=$(grep Version ../buildroot-2022.02.3/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
stmkernelversion=$(cat ../buildroot-2022.02.3/.config | grep KERNEL_VERSION | sed 's/.*"\(.*\)"[^"]*$/\1/')
stmubootversion=$(cat ../buildroot-2022.02.3/.config | grep UBOOT_VERSION | sed 's/.*"\(.*\)"[^"]*$/\1/')
manifestfile=../../../release/stm32_${version}/manifest.txt
checksumsdir=../../../release/stm32_${version}
##################################################
#Make Release Directory and Checksums Directory
##################################################
echo "Making release directory..."
cd ../release
mkdir stm32_${version}
cd stm32_${version}
##################################################
#Creating tar.xz and Signing For Release
##################################################
echo "Creating tar.xz and signing for release..."
cd ../../buildroot-2022.02.3/output/images
tar -czvf stm32_${version}_${creation_date}_signed.tar.xz *
echo "Signing release tar.xz..."
gpg --detach-sign stm32_*_signed.tar.xz
##################################################
#Make Manifest file.
##################################################
echo "Making Manifest Files and Checksums File..."
echo "Manifest: $timeanddate" > $manifestfile
echo "" >> $manifestfile
##################################################
#Insert STM32 Version Information
##################################################
echo "STM32 Information" >> $manifestfile
echo "**********************" >> $manifestfile
echo "STM32 Version: $version" >> $manifestfile
echo "Build Date: $creation_date" >> $manifestfile
echo "Kernel Version: $stmkernelversion" >> $manifestfile
echo "UBoot Version: $stmubootversion" >> $manifestfile
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
echo "File Hashes: " > $checksumsdir/checksums.txt
echo "***************************************************************************************************************************************************" >> $manifestfile
echo "***************************************************************************************************************************************************" >> $checksumsdir/checksums.txt
echo "SHA-256 Hashes: " >> $manifestfile
echo "SHA-256 Hashes: " >> $checksumsdir/checksums.txt
openssl dgst --sha256 * >> $manifestfile
openssl dgst --sha256 * >> $checksumsdir/checksums.txt
echo "" >> $manifestfile
echo "" >> $checksumsdir/checksums.txt
echo "SHA-512 Hashes: " >> $manifestfile
echo "SHA-512 Hashes: " >> $checksumsdir/checksums.txt
openssl dgst --sha512 * >> $manifestfile
openssl dgst --sha512 * >> $checksumsdir/checksums.txt
echo "" >> $manifestfile
echo "" >> $checksumsdir/checksums.txt
echo "SHA3-512 Hashes: " >> $manifestfile
echo "SHA3-512 Hashes: " >> $checksumsdir/checksums.txt
openssl dgst --sha3-512 * >> $manifestfile
openssl dgst --sha3-512 * >> $checksumsdir/checksums.txt
echo "***************************************************************************************************************************************************" >> $manifestfile
echo "***************************************************************************************************************************************************" >> $checksumsdir/checksums.txt
echo "Done Making Manifest and Checksum Files..."
##################################################
#Move signed tar.xz and change directory
##################################################
mv stm32_${version}_${creation_date}_signed* ../../../release/stm32_${version}
cd ../../../release/stm32_${version}
##################################################
#Sign the manifest
##################################################
echo "Signing manifest..."
gpg --detach-sign manifest.txt
##################################################
#Change Directory and sign the checksum file
##################################################
cd checksums
echo "Signing checksum file..."
gpg --detach-sign checksums.txt
echo "Done"