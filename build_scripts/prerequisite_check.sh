#!/bin/bash
#
##################################################
#Deactivate the perl extentions if needed...
##################################################
#eval $(perl -Mlocal::lib=--deactivate-all)
##################################################
#Check for necessary programs...
##################################################
echo "Checking Prerequisites...Only Messages on Errors..."
echo -ne '[                        ](0%)\r'
if rpm -qa | grep "which" 1> /dev/null ; then
	echo -ne '[=                       ](4%)\r'
else
	echo "Which not found...install Which and come back later..."
	exit
fi
if rpm -qa | grep "sed" 1> /dev/null ; then
	echo -ne '[==                      ](8%)\r'
else
	echo "sed not found...install sed and come back later..."
	exit
fi
if rpm -qa | grep "make" 1> /dev/null ; then
	echo -ne '[===                     ](12%)\r'
else
	echo "make not found...install make and come back later..."
	exit
fi
if rpm -qa | grep "binutils" 1> /dev/null ; then
	echo -ne '[====                    ](16%)\r'
else
	echo "binutils not found...install binutils and come back later..."
	exit
fi
if rpm -qa | grep "gcc" 1> /dev/null ; then
	echo -ne '[=====                   ](20%)\r'
else
	echo "gcc not found...install gcc and come back later..."
	exit
fi
if rpm -qa | grep "gcc-c++" 1> /dev/null ; then
	echo -ne '[======                  ](25%)\r'
else
	echo "gcc-c++ not found...install gcc-c++ and come back later..."
	exit
fi
if rpm -qa | grep "bash" 1> /dev/null ; then
	echo -ne '[=======                 ](29%)\r'
else
	echo "bash not found...install bash and come back later..."
	exit
fi
if rpm -qa | grep "patch" 1> /dev/null ; then
	echo -ne '[========                ](33%)\r'
else
	echo "patch not found...install patch and come back later..."
	exit
fi
if rpm -qa | grep "gzip" 1> /dev/null ; then
	echo -ne '[=========               ](37%)\r'
else
	echo "gzip not found...install gzip and come back later..."
	exit
fi
if rpm -qa | grep "bzip2" 1> /dev/null ; then
	echo -ne '[==========              ](41%)\r'
else
	echo "bzip2 not found...install bzip2 and come back later..."
	exit
fi
if rpm -qa | grep "perl" 1> /dev/null ; then
	echo -ne '[===========             ](45%)\r'
else
	echo "perl not found...install perl and come back later..."
	exit
fi
if rpm -qa | grep "tar" 1> /dev/null ; then
	echo -ne '[============            ](50%)\r'
else
	echo "tar not found...install tar and come back later..."
	exit
fi
if rpm -qa | grep "cpio" 1> /dev/null ; then
	echo -ne '[=============           ](54%)\r'
else
	echo "cpio not found...install cpio and come back later..."
	exit
fi
if rpm -qa | grep "unzip" 1> /dev/null ; then
	echo -ne '[==============          ](58%)\r'
else
	echo "unzip not found...install unzip and come back later..."
	exit
fi
if rpm -qa | grep "rsync" 1> /dev/null ; then
	echo -ne '[===============         ](62%)\r'
else
	echo "rsync not found...install rsync and come back later..."
	exit
fi
if rpm -qa | grep "file" 1> /dev/null ; then
	echo -ne '[================        ](66%)\r'
	if [ "`which file`" == /usr/bin/file ]; then
		echo -ne '[================        ](67%)\r'
else
	echo "file not found...install file and come back later..."
	echo "file must be in /usr/bin/file"
	exit
fi
fi
if rpm -qa | grep "bc" 1> /dev/null ; then
	echo -ne '[=================       ](70%)\r'
else
	echo "bc not found...install bc and come back later..."
	exit
fi
if rpm -qa | grep "wget" 1> /dev/null ; then
	echo -ne '[==================      ](75%)\r'
else
	echo "wget not found...install wget and come back later..."
	exit
fi
if rpm -qa | grep "python" 1> /dev/null ; then
	echo -ne '[===================     ](79%)\r'
else
	echo "python not found...install python and come back later..."
	exit
fi
if rpm -qa | grep "ncurses" 1> /dev/null ; then
	echo -ne '[====================    ](83%)\r'
else
	echo "ncurses packages not found...install ncurses and come back later..."
	exit
fi
if rpm -qa | grep "qt5" 1> /dev/null ; then
	echo -ne '[=====================   ](87%)\r'
else
	echo "qt5 packages not found...install qt5 and come back later..."
	exit
fi
if rpm -qa | grep "perl-ExtUtils-MakeMaker" 1> /dev/null ; then
	echo -ne '[======================  ](91%)\r'
else
	echo "perl-ExtUtils-MakeMaker packages not found...install MakeMaker and come back later..."
	exit
fi
if rpm -qa | grep "perl-FindBin" 1> /dev/null ; then
	echo -ne '[======================= ](95%)\r'
else
	echo "perl-FindBin packages not found...install FindBin and come back later..."
	exit
fi
if rpm -qa | grep "gtk2" 1> /dev/null ; then
	echo -ne '[==================== ](99%)\r'
else
	echo "gtk2 packages not found...install gtk2 and come back later..."
	exit
fi
echo -ne '[========================](100%)\r'
echo -ne '\n'
echo "Prerequisites check finished. If you made it here you're good!"