#!/bin/bash
#
#Write SD card for STM32 buildroot image.
#
lsblk
echo "Only use this if you set the output file of dd!"
#It's sdc on my machine. It very well may be different on yours
read -n1 -r -p "Press any non-NUL character to continue...CTRL+C to exit..." key
cd ../trunk/buildroot-2021.02.1
sudo dd if=output/images/sdcard.img of=/dev/sdc
echo "Image written"
