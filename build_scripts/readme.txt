This readme.txt file is to document the build_scripts directory and explain what each files does.
First Created: ejc - 08.18.2021
Last Modified: ejc - 07.27.2022

Some scripts are RHEL dependant. If you choose to you can edit the RHEL specific lines to your distro of choice.

-build
    -This file is for the build process and keeps track of how many builds have been processed or built.

-build_buildroot.sh
    -This script is for running the build process. Added checks for prerequisites that buildroot needs. Those checks are specific to RHEL versions of Linux. If using Ubuntu or Debian based distros change the "rpg -qa" to "dpkg -l" Once other software is integrated into this repository this will probably change to "build_all.sh"

-build_dev_branch.sh
    -This script will build the dev branch made by "make_dev_branch.sh" It is important you only have one dev branch directory in "branches" at a time since this script looks for any folder with "stm32_*_branch_dev" so it doesn't matter what the version number is. If you want to keep old dev branches it is recommended to archive them in a tar.xz/tgz file of some sort before building with "build_dev_branch.sh" This script also has its own motd creation where it will create the motd in the branch folder and append "_dev" to the version information. It will also append a line saying "***This is a dev branch build***" Dev branches will not be committed as they are test areas that would ultimately be merged into the trunk directory if the build passes tests. The built images are not signed and will never be released. If you come across a build that has this information in it please create an issue in GitHub.

-burn_sd.sh
    -This script is for automating the process to burn the sd card image. I've noticed if the script runs really fast (suspiciously fast) then it didn't work correctly. Unplug the SD card (and reader if applicable) and re-insert it and run the script again and/or use the clean disk function.

    -New functions.
        -Checks for certain packages that are needed for creating a fully formatted SD card.
        -Checks for devices that could be an SD card (< 32GB in size.) This can be changes by modifying "max_device_size" in the script.
            -NOTE: Check carefully before letting this script run wild because if you have other flash media plugged in it could grab one of those and write the image to it. Be sure to remove all other flash media before running. Only have the SD card you want to write this image to plugged into the system. The script will tell you what device it will use before continuing so double check before you continue. - This has been solved by checking for multiple devices. If there are more than one it should exit and tell you why. But please double, and triple check before continuing.
        -Write SD images from various places (trunk, branches, releases, custom directories)
        -Clean the disk (If you have written the SD card and think something else has gone wrong you can delete the disk and start from scratch.)
        -The old burn_sd.sh script will be left as is commented out at the very bottom of the script so it could be used if necessary. (For some reason the new script breaks.) The old warning applies to the old script. Check the output of dd to make sure you are writing to the correct device. Set sd_mount_point accordingly.
    -Known bugs.
        -Some SD readers will display two disks essentially for one SD card (I haven't figured out why yet.) This will cause the script to see more than one device and exit.
        -Internal SD readers that mount SD cards as "mmcblk" devices will not be seen by this script. Until I can figure this out it is recommended to use a USB to SD reader.
        -It may be necessary to clean the disk before burning a new image and running expand_rootfs.sh from the STM32 otherwise it could fail.
        -If you have a roofs partition it will need to be unmounted before cleaning the disk will work correctly. Or you could manually unmount and delete all partitions.
    -Tested Readers.
        -SABRENT USB3 SD reader (http://sabrent.com/products/CR-UMSS) works fine in RHEL9.
        -UGreen 2-in-1 USB 3.0 SD/TF Card Reader (https://www.ugreen.com/collections/usb-card-reader/products/usb-3-0-card-reader-with-sd-tf?variant=31772561866814) works fine in RHEL 8 but not in RHEL 9.
        -Dell Precision 3450 internal SD card reader mounts SD cards as "mmcblk" devices and is not recognized by this script.
        -IOGear GFR204SD SD reader (https://www.amazon.com/IOGEAR-MicroSD-Reader-Writer-GFR204SD/dp/B0046TJG1U) works fine in RHEL 9.
        -UGreen SD Card Reader USB 3.0 (https://www.amazon.com/UGREEN-Aluminum-Adapter-Windows-Chromebook/dp/B07VDDDPKY) creates duplicate devices, one with 0B in RHEL 9.

-make_backup.sh
    -This script is for making a backup tar.gz of the entire repository and save it to my HOME folder. This is more paranoia than anything. It really won't affect much but I made it for my own peace of mind. It's there, use it if you want to.

-make_branch.sh
    -This script creates a signed tar.gz of the current trunk to make a "backup" if you will of that branch. I will make branches in github as well but this just makes a nice package if someone wants to quickly download a specific branch. Each release will get a branch made like this. This will sign the file with GPG. If you use it for yourself you must make a keypair with GPG or comment out the signing lines. The manifest file is RHEL specific since it checks for the release name in "/etc/redhat-release" this can be changed for your specific distro.

-make_dev_branch.sh
    -This script is for making a special container for developing something that I don't necessarily want in the trunk at this time. I rsync the trunk into a dev branch directory that I make. Also makes a manifest file so I can keep track of the version information.

-make_release.sh
    -This script creates a signed tar.xz file of the current release deliverables, manifest and checksusm. This will sign the file with GPG. If you use it for yourself you must make a keypair with GPG or comment out the signing lines. The manifest file is RHEL specific since it checks for the release name in "/etc/redhat-release" this can be changed for your specific distro.

-motd_script.sh
    -This script is how I create the software version information. It parses the various versions of the ARM trusted firmware, Linux kernel, UBoot and others to put in the motd. Variables from this script go into motd_script.sh.When a build is processed this goes into the motd of the Linux filesystem and is shown to you at bootup.

-post-build.sh
    -This script is how I modify files in the root filesystem before the system images are created. Currently this is under development and is not called by buildroot or any other script.

-prerequisite_check.sh
	-This is the dependency check standalone script. Runs automatically in build_buildroot.sh but it's nice to have it in a standalone script to run quick checks. This script will only echo back if there's an error/missing packages, except for the start/end echos and progress bar.

-version.sh - Deprecated & Removed.
    -This script only increments the number in the build file. This is how I keep track of how many builds I've made and is part of the version number in motd_script.sh which relies on this script. It can be run individually but is called when motd_script.sh run as a post build script during the buildroot build process.