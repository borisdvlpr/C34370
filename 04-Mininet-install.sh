#!/bin/sh

# Check for root
[ $(id -u) -ne 0 ] && echo "Script must be executed with sudo" && exit

# Get mininet
git clone https://github.com/mininet/mininet

# Install mininet
mininet/util/install.sh

# Hack to get a better default font size in Xterm windows
XRESOURCES=/home/user/.Xresources
if [ -s $XRESOURCES ]; then
  grep -q -e "^xterm*faceName:"
  if [ $? -ne 0 ]; then
    echo "xterm*faceName: Monospace" >> $XRESOURCES
    echo "xterm*faceSize: 14" >> $XRESOURCES
    sudo -u user "xrdb -merge $XRESOURCES
  fi
else
  echo "xterm*faceName: Monospace" > $XRESOURCES
  echo "xterm*faceSize: 14" >> $XRESOURCES
  sudo -u user "xrdb -merge $XRESOURCES
fi
