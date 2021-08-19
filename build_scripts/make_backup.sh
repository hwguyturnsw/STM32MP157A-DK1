#!/bin/bash
#
#Make new backup
#2021-ejc
#
creation_date=$(date +%m.%d.%Y)
version=$(grep Version ../trunk/buildroot-2021.02.1/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
cd $HOME/backups
mkdir stm32_${version}_backup_${creation_date} && cd "$_"
echo "Backup Date: "$(date -u) > info.txt
echo "Machine Name: "$(hostname) >> info.txt
echo "User: "$(whoami) >> info.txt
echo "Version: "${version} >> info.txt
cd ../../STM32MP157A-DK1
tar -czvf stm32_backup_${creation_date}.tar.gz *
mv stm32_backup_${creation_date}.tar.gz $HOME/backups/stm32_${version}_backup_${creation_date}
#rsync -ah --progress ../../STM32MP157A-DK1/* ./
echo "Done"