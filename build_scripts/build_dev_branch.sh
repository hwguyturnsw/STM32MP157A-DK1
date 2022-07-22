#!/bin/bash
#
#Build buildroot dev branch for STM32
#ejc-07.22.2021
#
##################################################
#Deactivate the perl extentions if needed...
##################################################
#eval $(perl -Mlocal::lib=--deactivate-all)
##################################################
#Check for necessary programs...
##################################################
echo "Checking Prerequisites..."
echo -ne '[=                    ](0%)\r'
if rpm -qa | grep "which" 1> /dev/null ; then
	echo -ne '[==                   ](5%)\r'
else
	echo "Which not found...install Which and come back later..."
	exit
fi
if rpm -qa | grep "sed" 1> /dev/null ; then
	echo -ne '[====                 ](10%)\r'
else
	echo "sed not found...install sed and come back later..."
	exit
fi
if rpm -qa | grep "make" 1> /dev/null ; then
	echo -ne '[====                 ](15%)\r'
else
	echo "make not found...install make and come back later..."
	exit
fi
if rpm -qa | grep "binutils" 1> /dev/null ; then
	echo -ne '[=====                ](20%)\r'
else
	echo "binutils not found...install binutils and come back later..."
	exit
fi
if rpm -qa | grep "gcc" 1> /dev/null ; then
	echo -ne '[======               ](25%)\r'
else
	echo "gcc not found...install gcc and come back later..."
	exit
fi
if rpm -qa | grep "gcc-c++" 1> /dev/null ; then
	echo -ne '[=======              ](30%)\r'
else
	echo "gcc-c++ not found...install gcc-c++ and come back later..."
	exit
fi
if rpm -qa | grep "bash" 1> /dev/null ; then
	echo -ne '[========             ](35%)\r'
else
	echo "bash not found...install bash and come back later..."
	exit
fi
if rpm -qa | grep "patch" 1> /dev/null ; then
	echo -ne '[=========            ](40%)\r'
else
	echo "patch not found...install patch and come back later..."
	exit
fi
if rpm -qa | grep "gzip" 1> /dev/null ; then
	echo -ne '[==========           ](45%)\r'
else
	echo "gzip not found...install gzip and come back later..."
	exit
fi
if rpm -qa | grep "bzip2" 1> /dev/null ; then
	echo -ne '[===========          ](50%)\r'
else
	echo "bzip2 not found...install bzip2 and come back later..."
	exit
fi
if rpm -qa | grep "perl" 1> /dev/null ; then
	echo -ne '[============         ](55%)\r'
else
	echo "perl not found...install perl and come back later..."
	exit
fi
if rpm -qa | grep "tar" 1> /dev/null ; then
	echo -ne '[=============        ](60%)\r'
else
	echo "tar not found...install tar and come back later..."
	exit
fi
if rpm -qa | grep "cpio" 1> /dev/null ; then
	echo -ne '[==============       ](65%)\r'
else
	echo "cpio not found...install cpio and come back later..."
	exit
fi
if rpm -qa | grep "unzip" 1> /dev/null ; then
	echo -ne '[==============       ](65%)\r'
else
	echo "unzip not found...install unzip and come back later..."
	exit
fi
if rpm -qa | grep "rsync" 1> /dev/null ; then
	echo -ne '[===============      ](70%)\r'
else
	echo "rsync not found...install rsync and come back later..."
	exit
fi
if rpm -qa | grep "file" 1> /dev/null ; then
	echo -ne '[===============      ](70%)\r'
	if [ "`which file`" == /usr/bin/file ]; then
		echo -ne '[================     ](75%)\r'
else
	echo "file not found...install file and come back later..."
	exit
fi
fi
if rpm -qa | grep "bc" 1> /dev/null ; then
	echo -ne '[=================    ](80%)\r'
else
	echo "bc not found...install bc and come back later..."
	exit
fi
if rpm -qa | grep "wget" 1> /dev/null ; then
	echo -ne '[==================   ](85%)\r'
else
	echo "wget not found...install wget and come back later..."
	exit
fi
if rpm -qa | grep "python" 1> /dev/null ; then
	echo -ne '[===================  ](90%)\r'
else
	echo "python not found...install python and come back later..."
	exit
fi
if rpm -qa | grep "ncurses" 1> /dev/null ; then
	echo -ne '[==================== ](95%)\r'
else
	echo "ncurses packages not found...install ncurses and come back later..."
	exit
fi
if rpm -qa | grep "qt5" 1> /dev/null ; then
	echo -ne '[=====================](97%)\r'
else
	echo "qt5 packages not found...install qt5 and come back later..."
	exit
fi
if rpm -qa | grep "gtk2" 1> /dev/null ; then
	echo -ne '[=====================](100%)\r'
else
	echo "gtk2 packages not found...install gtk2 and come back later..."
	exit
fi
echo -ne '\n'
echo "Prerequisites check finished. If you made it here you're good!"
##################################################
#Making dev branch version numbers...
##################################################
echo "Making Versions..."
cd ../branches/stm32_*_branch_dev
build=$(cat ../../build_scripts/build)
((build++))
echo $build"_dev" > dev_build
echo "Making MOTD..."
echo "Going to find version numbers in buildroot..."
##################################################
#Version Variables
##################################################
kernelversion=$(cat .config | grep KERNEL_VERSION | sed 's/.*"\(.*\)"[^"]*$/\1/')
ubootversion=$(cat .config | grep UBOOT_VERSION | sed 's/.*"\(.*\)"[^"]*$/\1/')
#svnrev=$(svn info | grep "Revision: " | sed 's/[^0-9]//g')
build=$(cat dev_build)
major="0"
minor="2"
gitHEAD=$(git rev-parse HEAD)
##################################################
#Go back overlay area
##################################################
echo "Going back to overlay/etc area"
cd board/stmicroelectronics/stm32mp157a-dk1/overlay/etc
##################################################
#Make the motd file itself
##################################################
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
echo "***************************************************" >> motd
echo "***This is a dev branch build***" >> motd
echo "***************************************************" >> motd
echo "" >> motd
echo "" >> motd
echo "Done!"
############################################################
#Change directory to buildroot dev branch, clean and make...
############################################################
echo "Making buildroot..."
cd ../../../../../
echo "Running make clean..."
make clean
echo "Done cleaning..."
echo "Building..."
make
echo "Done processing build!"
echo "Go burn sd card after build..."
cd ../../build_scripts