#!/bin/bash
#
#Generate GitHub release tag
#ejc-07.27.2022
#Last updated: 01.06.2024
#
##################################################
#Variables
##################################################
version=$(grep Version ../buildroot-2022.02.3/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
echo ""
echo "*******************************************************"
echo "Don't run this until all sources are committed to main!"
echo "Are you sure you want to generate release tag?"
echo "*******************************************************"
echo "You will also need your GitHub personal access token!"
echo "*******************************************************"
read -n1 -r -p "Press any non-NUL character to continue...CTRL+C to exit..." key
##################################################
#Generate release tag...
##################################################
git tag -s v$version -m "stm32_$version"
git tag --verify v$version
git push --tags origin
echo "Done!"