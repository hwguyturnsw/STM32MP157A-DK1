#!/bin/bash
#
#Make new branch
#2021-ejc
#
creation_date=$(date +%m.%d.%Y)
version=$(grep Version ../trunk/buildroot-2021.02.1/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
cd ../branches
mkdir stm32_${version}_branch && cd "$_"
echo $(date -u) > version.txt
echo "STM32 Trunk Version: ${version}" >> version.txt
cd ../../trunk
tar -czvf ${version}_branch.tar.gz *
mv ${version}_branch* ../branches/stm32_${version}_branch
cd ../branches/stm32_${version}_branch
sha256sum *.* > sha256sums.txt
gpg --detach-sign ${version}_branch.tar.gz
gpg --detach-sign sha256sums.txt
gpg --detach-sign version.txt
echo "Done"