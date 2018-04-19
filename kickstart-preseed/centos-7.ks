#------------------------------------------------------------
#version=RHEL7
#platform=x86, AMD64, ou Intel EM64T
#------------------------------------------------------------

#Accept Eula
eula --agreed

#System  language
lang en_US.UTF-8

#Sytem timezone
timezone Europe/Paris --isUtc

#System keyboard
keyboard fr

#text installation
text
skipx

# install from scratch
install

# Eject CDROM and Reboot after installation
reboot --eject

# System authorization information
auth --enableshadow --passalgo=sha512

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --no-activate
network  --hostname=localhost.localdomain

# User configuration
rootpw secret
user --groups=wheel --name=centos --password secret --gecos="centos"

# System services
services --enabled="chronyd"

# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr

# Partition clearing information
clearpart --none --initlabel

# Disk partitioning information
part /boot --fstype="ext4" --size=1024
part swap --fstype="swap" --size=1024
part / --fstype="ext4" --grow

%packages
@^minimal
@core
chrony
kexec-tools

# unnecessary firmware
-aic94xx-firmware
-atmel-firmware
-b43-openfwwf
-bfa-firmware
-ipw2100-firmware
-ipw2200-firmware
-ivtv-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl3945-firmware
-iwl4965-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6000g2a-firmware
-iwl6050-firmware
-libertas-usb8388-firmware
-ql2100-firmware
-ql2200-firmware
-ql23xx-firmware
-ql2400-firmware
-ql2500-firmware
-rt61pci-firmware
-rt73usb-firmware
-xorg-x11-drv-ati-firmware
-zd1211-firmware
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
