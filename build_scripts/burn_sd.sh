#!/bin/bash
#
#Write SD card for STM32 buildroot image.
#
lsblk
cd ../trunk/buildroot-2021.02.1
sudo dd if=output/images/sdcard.img of=/dev/sdc
echo "Image written"
