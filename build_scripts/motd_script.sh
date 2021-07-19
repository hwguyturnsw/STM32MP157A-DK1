#!/bin/bash
#Post build script to embed version with buildroot image as Linux MOTD
####****ONLY WORKS FROM TRUNK BUILDROOT DIRECTORY AS BUILDROOT RUNS****####
/bin/bash ../../build_scripts/version.sh
echo "Making MOTD..."
echo "Going back to find version numbers in buildroot..."

#Version Variables
kernelversion=$(cat .config | grep KERNEL_VERSION | sed 's/.*"\(.*\)"[^"]*$/\1/')
ubootversion=$(cat .config | grep UBOOT_VERSION | sed 's/.*"\(.*\)"[^"]*$/\1/')
#svnrev=$(svn info | grep "Revision: " | sed 's/[^0-9]//g')
build=$(cat ../../build_scripts/build)
major="0"
minor="1"
gitHEAD=$(git rev-parse HEAD)


#Go back overlay area
echo "Going back to overlay/etc area"
cd board/stmicroelectronics/stm32mp157a-dk1/overlay/etc

#Make the motd file itself
echo "" > motd
echo "" >> motd
echo "****************************************" >> motd
echo "Welcome to the STM32 Buildroot Image" >> motd
echo "Version: $major.$minor.$build" >> motd
echo "Github ID: $gitHEAD" >> motd
echo "Build Date: "$(date -u) >> motd
echo "Build Machine: "$(hostname) >> motd
echo "Linux Kernel: $kernelversion" >> motd
echo "U-Boot: $ubootversion" >> motd
echo "Arch: ARMv71 - Cortex A7" >> motd
echo "****************************************" >> motd
echo "" >> motd
echo "" >> motd
echo "Done!"