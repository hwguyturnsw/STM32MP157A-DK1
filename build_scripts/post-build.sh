#!/bin/bash
#Post Build Script
#ejc - 2022
#STM32MP157A-DK1 Board
#
#
targetFileSystem=$1

echo "Executing Post-Build Script..."

# Set the execute bit on the expand root filesystem shell script
chmod +x ${targetFileSystem}/etc/expand_rootfs.sh