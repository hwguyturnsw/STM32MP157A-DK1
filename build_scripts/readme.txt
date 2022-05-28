This readme.txt file is to document the build_scripts directory and explain what each files does.
First Created: ejc - 08.18.2021
Last Modified: ejc - 05.27.2022

-build
    -This file is for the build process and keeps track of how many builds have been processed or built.

-build_buildroot.sh
    -This script is for running the build process. Added checks for prerequisites that buildroot needs. Once other software is integrated into this repository this will probably change to "build_all.sh"

-burn_sd.sh
    -This script is for automating the process to burn the sd card image. DO NOT use this file unless you manually change the sdX file that your sd card resides in. Issue #6 shall render this warning useless because I want to eventually have this script automatically find the sd card.

-make_backup.sh
    -This script is for making a backup tar.gz of the entire repository and save it to my HOME folder. This is more paranoia than anything. It really won't affect much but I made it for my own peace of mind. It's there, use it if you want to.

-make_branch.sh
    -This script creates a signed tar.gz of the current trunk to make a "backup" if you will of that branch. I will make branches in github as well but this just makes a nice package if someone wants to quickly download a specific branch. Each release will get a branch made like this. This will sign the file with GPG. If you use it for yourself you must make a keypair with GPG or comment out the signing lines.

-make_release.sh
    -This script creates a signed tar.xz file of the current release deliverables, manifest and checksusm. This will sign the file with GPG. If you use it for yourself you must make a keypair with GPG or comment out the signing lines.

-motd_script.sh
    -This script is how I create the software version information. It parses the various versions of the ARM trusted firmware, Linux kernel, UBoot and others to put in the motd. Variables from this script go into motd_script.sh.When a build is processed this goes into the motd of the Linux filesystem and is shown to you at bootup. Heavily relies on the build file and version.sh. This is a post build script in buildroot to embed version with buildroot image as Linux MOTD ####****ONLY WORKS FROM TRUNK BUILDROOT DIRECTORY AS BUILDROOT RUNS****####

-version.sh - Deprecated!
    -This script only increments the number in the build file. This is how I keep track of how many builds I've made and is part of the version number in motd_script.sh which relies on this script. It can be run individually but is called when motd_script.sh run as a post build script during the buildroot build process.
