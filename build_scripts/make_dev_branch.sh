#!/bin/bash
#
#Make developmental branch
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
manifestfile=dev_manifest.txt
##################################################
#Make Branch Directory
##################################################
cd ../branches
mkdir stm32_${version}_branch_dev
##################################################
#Change directory and run Make clean
##################################################
cd ../trunk/buildroot-2022.02.3
make clean
rsync -a --info=progress2 --info=name0 ./ ../../branches/stm32_${version}_branch_dev
cd ../../branches/stm32_${version}_branch_dev
##################################################
#Change directory and make Manifest file.
##################################################
echo "Making Manifest File..."
echo "Manifest: $timeanddate" > $manifestfile
echo "" >> $manifestfile
##################################################
#Insert STM32 Version Information
##################################################
echo "**********************" >> $manifestfile
echo "STM32 Version: $version"_dev"" >> $manifestfile
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
echo "Done Making Manifest File..."
##################################################
echo "Done"