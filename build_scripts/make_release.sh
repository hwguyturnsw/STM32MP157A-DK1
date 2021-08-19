#!/bin/bash
#
#Make new release
#2021-ejc
#
creation_date=$(date +%m.%d.%Y)
version=$(grep Version ../trunk/buildroot-2021.02.1/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
echo "Making release file..."
cd ../releases
mkdir stm32_${version}
cd ../trunk/buildroot-2021.02.1/output/images
tar -czvf stm32_${version}_${creation_date}_signed.tar.xz *
sha256sum * > sha256sums.txt
echo "Signing release..."
gpg --detach-sign stm32_*_signed.tar.xz
gpg --detach-sign sha256sums.txt
mv stm32_${version}_${creation_date}_signed* ../../../../releases/stm32_${version}_test
mv sha256sums* ../../../../releases/stm32_${version}
echo "Done"