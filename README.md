# STM32MP157A-DK1  
Buildroot for STM32MP157A-DK1 development kit. https://buildroot.org/  
See STMicro's website here https://www.st.com/en/evaluation-tools/stm32mp157a-dk1.html  
This is for the STM32MP157A-DK1 board but could be used on a custom board as well.  
License GNU GPL v2  
No warranty is implied by me, Buildroot, or UBoot.  
  
  
# Basic Information
Arch: ARM-Cortex-A7  
Kernel: v5.10.25  
UBoot: v2021.01  
ARM Trusted Firmware: v2.2  
Filesystem: EXT4  
RootFS Size: 256M  
Password Encoding: SHA256  
Shell: Bash  
Users: root, user  
Password (root & user): test1234  
  
  
#  Directions
Run <i>"build_buildroot.sh"</i> from <i><b>build_scripts</b></i> directory or specific branch directory (this will ensure you get the correct version numbers in the motd.) Then write <i><b>sd.img</b></i> from <i><b>../builroot-2021.02.1/output/images</b></i> to SD card using dd or Balena Etcher.  

There is a build script for this but please change the output file to the SD card in the script for your particular machine.  

Feel free to create an issue if there are problems and I will get to them as soon as I can.  
  
# Documentation  
Please read the buildroot manual before creating issues with building:  
https://buildroot.org/downloads/manual/manual.html  
You could simply be missing a required package:  
https://buildroot.org/downloads/manual/manual.html#requirement-mandatory  
See buildroot support:  
https://buildroot.org/support.html  
The manual also has other formats available here:  
https://buildroot.org/docs.html  
  
# GPG Signatures  
Signatures can be verified by my public key here:  
https://keys.openpgp.org/vks/v1/by-fingerprint/8D4CCC65EDC4E2DA6A6BE571822932C729F9B6D2  
  
Thanks,  
ejc  
