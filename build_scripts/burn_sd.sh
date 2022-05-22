#!/bin/bash
#
#Write SD card for STM32 buildroot image.
#
#Set the mount point of your SD card here.
sd_mount_point=sdc
#
if ! id | grep -q root; then
	echo "Must be run as root"
	exit
fi
echo " "
echo "Here's the output from 'lsblk' check to make sure you're sd card is here!"
echo " "
lsblk
echo " "
echo "Only use this if you set the output file of dd!"
echo "I'm going to use '$sd_mount_point'"
#It's sdc on my machine. It very well may be different on yours
echo " "
echo "Are you ready to use '$sd_mount_point' ?"
read -n1 -r -p "Press any non-NUL character to continue...CTRL+C to exit..." key
cd ../trunk/buildroot-2021.02.1
sudo dd if=output/images/sdcard.img of=/dev/$sd_mount_point
echo "Image written"
