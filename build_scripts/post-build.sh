#!/bin/bash
#
#ejc-07.27.2022
#Last updated: 01.06.2024
#Post Build Script
#STM32MP157A-DK1 Board
#
#
targetFileSystem=$1

echo "Executing Post-Build Script..."

# Set the execute bit on the expand root filesystem shell script
chmod +x ${targetFileSystem}/etc/expand_rootfs.sh