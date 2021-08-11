# STM32MP157A-DK1  
Buildroot for STM32MP157A-DK1 development kit.  
See STMicro's website here https://www.st.com/en/evaluation-tools/stm32mp157a-dk1.html  
This is for the STM32MP157A-DK1 board but could be used on a custom board as well.  
License GNU GPL v2  
No warranty is implied by me, Buildroot, or UBoot.  
  
  
Arch: ARM-Cortex-A7  
Kernel: v5.8.13  
UBoot: v2020.07  
ARM Trusted Firmware: v2.2  
Filesystem: EXT4  
RootFS Size: 120M  
Password Encoding: SHA256  
Shell: Bash  
Users: root, user  
Password (root & user): test1234  
  

Run "make" from trunk/buildroot-2021.02.1 directory or specific branch directory and write sd.img from builroot-2021.02.1/output/images to SD card.

Feel free to create an issue if there are problems and I will get to them as soon as I can.

Thanks,
ejc