#!/bin/bash
#Pre build script to embed version with buildroot image as Linux MOTD
#Buildroot Version Numbering
build=$(cat build)
((build++))
echo $build > build

echo "Making MOTD..."
echo "Going back to find version numbers in buildroot..."
cd ../trunk/buildroot-2021.02.1/
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
echo "*****************************************" >> motd
echo "This software is licensed under" >> motd
echo "GNU GENERAL PUBLIC LICENSE" >> motd
echo "GPL V2, June 1991">> motd
echo "You are free to use and re-distribute" >> motd
echo "but there is no implied warranty by any" >> motd
echo "of the developers of this software or any" >> motd
echo "of the software contained within." >> motd
echo "This is a development platflorm for the" >> motd
echo "STM32MP157-DK1 development board" >> motd
echo "*****************************************" >> motd
echo "" >> motd
echo "************************************************************************************" >> motd
echo "   _____ _______ __  __ ____ ___  __  __ _____  __ _____ ______      _____  _  ____ " >> motd
echo "  / ____|__   __|  \/  |___ \__ \|  \/  |  __ \/_ | ____|____  |    |  __ \| |/ /_ |" >> motd
echo " | (___    | |  | \  / | __) | ) | \  / | |__) || | |__     / /_____| |  | | ' / | |" >> motd
echo "  \___ \   | |  | |\/| ||__ < / /| |\/| |  ___/ | |___ \   / /______| |  | |  <  | |" >> motd
echo "  ____) |  | |  | |  | |___) / /_| |  | | |     | |___) | / /       | |__| | . \ | |" >> motd
echo " |_____/   |_|  |_|  |_|____/____|_|  |_|_|     |_|____/ /_/        |_____/|_|\_\|_|" >> motd
echo "                                                                                    " >> motd
echo "************************************************************************************" >> motd
echo "" >> motd
echo "***************************************************" >> motd
echo "Welcome to the STM32 Buildroot Image" >> motd
echo "Version: $major.$minor.$build" >> motd
echo "Github ID: $gitHEAD" >> motd
echo "Build Date: "$(date -u) >> motd
echo "Build Machine: "$(hostname) >> motd
echo "Linux Kernel: $kernelversion" >> motd
echo "U-Boot: $ubootversion" >> motd
echo "Arch: ARMv71 - Cortex A7" >> motd
echo "***************************************************" >> motd
echo "" >> motd
echo "" >> motd
cd ../../../../../../../build_scripts
echo "Done!"