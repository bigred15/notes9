#!/bin/bash
################################################################### 
# Script: 	notes9_installer.sh				  #
# Description: 	This script automates the installation of the 	  #
#              	IBM Lotus Notes 9.0.1 Client on Ubuntu 16.10      #
# Author: 	Michael Andrews					  # 
# Date: 	19/10/2016					  #
###################################################################
# Usage: 	This shell script needs to be installed in the 	  #
#		directory where the NOTES 9 Linux client tar file #
# 		is, as well as the NOTES 9 Fixpack tar. 	  #
#		This directory should specified in the WORKINGDIR #
#		variable below.			  		  #	
###################################################################

#############
# Variables #
#############
WORKINGDIR=/home/bigred/packages/notes
NOTES_TAR=/home/bigred/packages/notes/NOTES_9.0.1_LINUX_DI_EN.tar
FIXPACK_TAR=/home/bigred/packages/notes/notes901FP7_linuxUb.tar

########################
# Install Dependancies #
########################
sudo apt-get install -y libart-2.0-2:i386 libasound2:i386 libatk1.0-0:i386 libavahi-client3:i386 libavahi-common3:i386 libavahi-glib1:i386 libbonobo2-0:i386 libbonoboui2-0:i386 libc6:i386 libcairo2:i386 libcanberra0:i386 libcomerr2:i386 libcups2:i386 libdbus-1-3:i386 libdbus-glib-1-2:i386 libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 libgail18:i386 libgcc1:i386 libgconf-2-4:i386 libgdk-pixbuf2.0-0:i386 libglib2.0-0:i386 libgnome2-0:i386 libgnomecanvas2-0:i386 libgnome-keyring0:i386 libgnomeui-0:i386 libgnomevfs2-0:i386 libgpg-error0:i386 libgssapi-krb5-2:i386 libgtk2.0-0:i386 libhunspell-1.4-0:i386 libice6:i386 libjpeg62:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-3:i386 libkrb5support0:i386 libltdl7:i386 libnspr4:i386 libnspr4-0d:i386 libnss3:i386 libogg0:i386 liborbit2:i386 libp11-kit0:i386 libpam0g:i386 libpango1.0-0:i386 libpcre3:i386 libpixman-1-0:i386 libpng16-16:i386 libpopt0:i386 libselinux1:i386 libsm6:i386 libstdc++6:i386 libtasn1-6:i386 libtdb1:i386 libuuid1:i386 libvorbis0a:i386 libvorbisfile3:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxcb-render0:i386 libxcb-shm0:i386 libxcomposite1:i386 libxcursor1:i386 libxdamage1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxft2:i386 libxi6:i386 libxinerama1:i386 libxml2:i386 libxrandr2:i386 libxrender1:i386 libxss1:i386 libxt6:i386 libxtst6:i386 zlib1g:i386 unity-gtk2-module:i386 libcanberra-gtk-module:i386 libxss1:i386 gtk2-engines-murrine:i386 p11-kit-modules:i386 libp11-kit-gnome-keyring:i386 ttf-xfree86-nonfree gdb iproute2 libgconf2-4:i386 libxkbfile1:i386 lib32ncurses5 lib32z1 libidl-2-0:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 libasound2-plugins:i386 libgail-common:i386 overlay-scrollbar-gtk2 libgnome-desktop-3-12:i386 libatk-adaptor:i386 libgcrypt20:i386 libgnutls30:i386

##################
# Unpack Notes 9 #
##################
cd $WORKINGDIR
tar -xvf $NOTES_TAR 

###########################################################
# Re-Build Debian Package Files with Correct Dependancies #
###########################################################

# Rebuild Notes #

dpkg-deb -x ibm-notes-9.0.1.i586.deb common
dpkg-deb --control ibm-notes-9.0.1.i586.deb
sed -i -e 's/Pre-Depends:.*/Pre-Depends: gdb:i386 | gdb:amd64, coreutils:i386 | coreutils:amd64, unzip:i386 | unzip:amd64, bash:i386 | bash:amd64, procps:i386 | procps:amd64, grep:i386 | grep:amd64, sed:i386 | sed:amd64, libart-2.0-2:i386, libasound2:i386, libatk1.0-0:i386, libavahi-client3:i386, libavahi-common3:i386, libavahi-glib1:i386, libbonobo2-0:i386, libbonoboui2-0:i386, libc6:i386, libcairo2:i386, libcanberra0:i386, libcomerr2:i386, libcups2:i386, libdbus-1-3:i386, libdbus-glib-1-2:i386, libexpat1:i386, libffi6:i386, libfontconfig1:i386, libfreetype6:i386, libgail18:i386, libgcc1:i386, libgconf-2-4:i386, libgcrypt11:i386 | libgcrypt20:i386, libgdk-pixbuf2.0-0:i386, libglib2.0-0:i386, libgnome2-0:i386, libgnomecanvas2-0:i386, libgnome-keyring0:i386, libgnomeui-0:i386, libgnomevfs2-0:i386, libgnutls26:i386 | libgnutls30:i386, libgpg-error0:i386, libgssapi-krb5-2:i386, libgtk2.0-0:i386, libhunspell-1.4-0:i386, libice6:i386, libjpeg62:i386, libk5crypto3:i386, libkeyutils1:i386, libkrb5-3:i386, libkrb5support0:i386, libltdl7:i386, libnspr4:i386, libnspr4-0d:i386, libnss3:i386, libogg0:i386, liborbit2:i386, libp11-kit0:i386, libpam0g:i386, libpango1.0-0:i386, libpcre3:i386, libpixman-1-0:i386, libpng16-16:i386, libpopt0:i386, libselinux1:i386, libsm6:i386, libstdc++6:i386, libtasn1-3:i386 | libtasn1-4:i386 | libtasn1-5:i386 | libtasn1-6:i386, libtdb1:i386, libuuid1:i386, libvorbis0a:i386, libvorbisfile3:i386, libx11-6:i386, libxau6:i386, libxcb1:i386, libxcb-render0:i386, libxcb-shm0:i386, libxcomposite1:i386, libxcursor1:i386, libxdamage1:i386, libxdmcp6:i386, libxext6:i386, libxfixes3:i386, libxft2:i386, libxi6:i386, libxinerama1:i386, libxml2:i386, libxrandr2:i386, libxrender1:i386, libxss1:i386, libxt6:i386, libxtst6:i386, zlib1g:i386, unity-gtk2-module:i386, libcanberra-gtk-module:i386, libxss1:i386, gtk2-engines-murrine:i386, p11-kit-modules:i386, libp11-kit-gnome-keyring:i386, ttf-xfree86-nonfree:i386 | ttf-xfree86-nonfree:amd64, libz1:i386, libgconf2-4:i386, libxkbfile1:i386, libgnome-desktop-2 | libgnome-desktop-2-7 | libgnome-desktop-2-11 | libgnome-desktop-2-17 | libgnome-desktop-3-2 | libgnome-desktop-3-12, libidl-2-0:i386, libpangox-1.0-0:i386, libpangoxft-1.0-0:i386, libasound2-plugins:i386, libgail-common:i386, libatk-adaptor:i386, overlay-scrollbar-gtk2:i386 | overlay-scrollbar-gtk2:amd64/' DEBIAN/control
cp -a DEBIAN common
dpkg -b common ibm-notes-9.0.1.i586.deb

# Install Lotus Notes Client #
sudo dpkg -i ibm-notes-9.0.1.i586.deb

# Clean Up #
sudo rm -rf DEBIAN/
sudo rm -rf common/

# Rebuid Sametime #

dpkg-deb -x ibm-sametime-9.0.1.i586.deb common
dpkg-deb --control ibm-sametime-9.0.1.i586.deb
sed -i -e 's/Pre-Depends:.*/Pre-Depends: ibm-notes, alsa-base, alsa-utils:i386 | alsa-utils:amd64 , iproute:i386 | iproute2:i386 | iproute:amd64 | iproute2:amd64/' DEBIAN/control
cp -a DEBIAN common
dpkg -b common ibm-sametime-9.0.1.i586.deb
 
# Install Lotus Notes Sametime #
sudo dpkg -i ibm-sametime-9.0.1.i586.deb

# Install Lotus Notes Feedreader #
sudo dpkg -i ibm-feedreader-9.0.1.i586.deb

###########################
# Install Latest Fix Pack #
###########################
tar -xvf $FIXPACK_TAR
sudo ./ibm_notes_fixpack.sh

