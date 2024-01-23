#!/bin/sh

# Check for root
[ $(id -u) -ne 0 ] && echo "Script must be executed with sudo" && exit

# Stop/disable some irrelevant services
for p in avahi-daemon.service avahi-daemon.socket casper.service casper-md5check.service cups.service cups-browsed.service wpa_supplicant.service ModemManager.service ufw.service
do
   systemctl stop ${p}
   systemctl mask ${p}
done

# Add user to vboxsf group for shared folder
usermod -aG vboxsf user

# Miscellaneous other packages
apt-get -y install wireshark conntrack conntrackd xterm

# Add user to sudoers file
grep -q -e "^user" /etc/sudoers || /usr/bin/echo -e "user\tALL = NOPASSWD: ALL" >> /etc/sudoers 
