#!/bin/sh

# Check for root
[ $(id -u) -ne 0 ] && echo "Script must be executed with sudo" && exit

# Stop/disable some irrelevant services
# NOTE: casper.service casper-md5check.service removed when not Linux Mint
for p in avahi-daemon.service avahi-daemon.socket cups.service cups-browsed.service wpa_supplicant.service ModemManager.service ufw.service
do
   systemctl stop ${p}
   systemctl mask ${p}
done
if [ -f /etc/os-release ] 
then
   . /etc/os-release
   if [ "${NAME}" = "Linux Mint" ]
   then
      systemctl stop casper.service
      systemctl mask casper.service
      systemctl stop casper-md5check.service
      systemctl mask casper-md5check.service
   fi
fi

# Add user to vboxsf group for shared folder
usermod -aG vboxsf user

# Miscellaneous other packages
apt-get -y install wireshark conntrack conntrackd xterm

# Add user to sudoers file
# grep -q -e "^user" /etc/sudoers || /usr/bin/echo -e "user\tALL = NOPASSWD: ALL" >> /etc/sudoers 

# Cleanup apt-get
apt-get clean
