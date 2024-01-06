#!/bin/bash
#
#Make new backup
#ejc-07.27.2022
#Last updated: 01.06.2024
#
creation_date=$(date +%m.%d.%Y)
version=$(grep Version ../buildroot-2022.02.3/board/stmicroelectronics/stm32mp157a-dk1/overlay/etc/motd | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
cd $HOME/backups
mkdir stm32_${version}_backup_${creation_date} && cd "$_"
echo "Backup Date: "$(date -u) > info.txt
echo "Machine Name: "$(hostname) >> info.txt
echo "User: "$(whoami) >> info.txt
echo "Version: "${version} >> info.txt
cd ../../STM32MP157A-DK1
tar -czvf stm32_backup_${creation_date}.tar.gz *
mv stm32_backup_${creation_date}.tar.gz $HOME/backups/stm32_${version}_backup_${creation_date}
echo "Done"