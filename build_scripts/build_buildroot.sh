#!/bin/bash
#
#Build buildroot for STM32
#ejc-07.27.2022
#Last updated: 01.06.2024
#
##################################################
#Deactivate the perl extentions if needed...
##################################################
#eval $(perl -Mlocal::lib=--deactivate-all)
##################################################
#Check for necessary programs...
##################################################
bash ./prerequisite_check.sh
##################################################
#Making version numbers...
##################################################
echo "Making Versions..."
bash ./motd_script.sh
##################################################
#Change directory to buildroot, clean and make...
##################################################
echo "Making buildroot..."
cd ../buildroot-2022.02.3
echo "Running make clean..."
make clean
echo "Done cleaning..."
echo "Building..."
make
echo "Done processing build! - No error checking from buildroot exists...check for errors."
echo "Go burn sd card after build..."