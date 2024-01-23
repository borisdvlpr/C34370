#!/bin/sh

# Check for root
if [ $(id -u) -ne 0 ]
then
   echo "This script should be executed as root"
   exit 0
fi

apt update
apt -y install at zenity
curl -Lo - https://github.com/skydive-project/skydive-binaries/raw/jenkins-builds/skydive-latest.gz | gzip -d > skydive && chmod +x skydive && sudo mv skydive /usr/local/bin/
cp SkydiveCtrl /usr/local/bin
chmod +x /usr/local/bin/SkydiveCtrl
