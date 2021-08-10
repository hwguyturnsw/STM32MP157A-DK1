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
  
-Packages:  
-  Busybox  
-  autofs  
-  e2fsprogs  
-    fsck  
-    resize2fs  
-  dropbear  
-  getsftpserver  
-  ifupdown scripts  
-  urandom-initscripts  
-  zsh  
-  neofetch  
-  sudo  
-  which  
-  htop  
-  tar  
-  util-linux  
-    basic set  
-  nano  
  
-Libraries:  
-  zlib  
-  openssl  
-  openssl binary  
-  openssl additional engines  

GPG Test...