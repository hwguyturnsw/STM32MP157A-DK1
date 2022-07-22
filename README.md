# STM32MP157A-DK1  
Buildroot for STM32MP157A-DK1 development kit. https://buildroot.org/  
See STMicro's website here https://www.st.com/en/evaluation-tools/stm32mp157a-dk1.html  
This is for the STM32MP157A-DK1 board but could be used on a custom board as well.  
License GNU GPL v2  
No warranty is implied by me, Buildroot, or UBoot.  
  
  
# Basic Information
Arch: ARM-Cortex-A7  
Kernel: v5.8.13  
UBoot: v2020.07   
ARM Trusted Firmware: v2.2  
Filesystem: EXT4  
RootFS Size: 256M  
Password Encoding: SHA256  
Shell: Bash  
Users: root, user  
Password (root & user): test1234  

# Development System
Currently the build system that I use is a RHEL based system (CentOS 8 Stream) Some of the build scripts reflect this type of configuration. If you do not have a RHEL based system or would like to build on another system you may have to change some of the build scripts to reflect that change. Please see the readme in the build scripts directory for the necessary changes.  
 
#  Directions
Run <i>"build_buildroot.sh"</i> from <i><b>build_scripts</b></i> directory or specific branch directory (this will ensure you get the correct version numbers in the motd.) Then write <i><b>sd.img</b></i> from <i><b>../builroot-2021.02.1/output/images</b></i> to SD card using dd or Balena Etcher.  

There is a build script for this but please double check the script picks up the correct device.

Feel free to create an issue if there are problems and I will get to them as soon as I can.  

If you get a response of 2 devices from burn_sd.sh and your lsblk command looks like this...  
```
$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    1     0B  0 disk 
sdb           8:16   1  14.9G  0 disk 
```
You may have to try another card reader, or run the dd command manually.

An expand root filesystem script was created and added. "/etc/expand_rootfs.sh"
To run this script enter the following commands as root. A reboot is necessary after the commands are run.  
```
chmod +x /etc/expand_rootfs.sh
/etc/./expand_rootfs.sh
reboot now
```
This is what ```lsblk``` and ```df -h``` should look like after expanding (with a 16GB SD card...for reference.)
```
root@STM32:~# lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
mmcblk0     179:0    0  14.9G  0 disk
|-mmcblk0p1 179:1    0 199.5K  0 part
|-mmcblk0p2 179:2    0 199.5K  0 part
|-mmcblk0p3 179:3    0   862K  0 part
`-mmcblk0p4 179:4    0  14.9G  0 part /
root@STM32:~# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/root                14.4G     39.9M     13.8G   0% /
devtmpfs                137.1M         0    137.1M   0% /dev
tmpfs                   201.6M         0    201.6M   0% /dev/shm
tmpfs                   201.6M     28.0K    201.5M   0% /tmp
tmpfs                   201.6M    112.0K    201.5M   0% /run
```

An enable file exists to allow the script to be run. Once it has been run it cannot run again unless that file exists.  
This is to prevent the script from running again unnecessarily (If I can get it to run automatically from init.d) a "run once" if you will.  
See below for what you will encounter if you try and run the script again.  

```
root@STM32:/etc# ./expand_rootfs.sh
Attempting Expand Rootfs...
Checking Enable File...
File NOT found! - Skipping expansion of root filesystem...
```

This has been tested with 16GB, 8GB, and 4GB SD cards.  
  
# Documentation  
Please read the buildroot manual before creating issues with building:  
https://buildroot.org/downloads/manual/manual.html  
You could simply be missing a required package:  
https://buildroot.org/downloads/manual/manual.html#requirement-mandatory  
See buildroot support:  
https://buildroot.org/support.html  
The manual also has other formats available here:  
https://buildroot.org/docs.html  
  
# GPG Signatures  
Signatures can be verified by my public key here:  
https://keys.openpgp.org/vks/v1/by-fingerprint/8D4CCC65EDC4E2DA6A6BE571822932C729F9B6D2  
  
Thanks,  
ejc  
