#!/bin/bash
#
#Build buildroot for STM32
#ejc-05.23.2021
#
#echo "Prerequisites..."
#eval $(perl -Mlocal::lib=--deactivate-all)
echo "Making buildroot..."
cd ../trunk/buildroot-2021.02.1
echo "Running make clean..."
make clean
echo "Done cleaning..."
echo "Building..."
make
echo "Done processing build!"
echo "Go burn sd card after build, set sdX with the sd card from lsblk..."
