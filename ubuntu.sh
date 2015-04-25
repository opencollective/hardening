#!/bin/bash
# konstruktoid.net
#
# Documentation:
# https://github.com/konstruktoid/hardening
# https://benchmarks.cisecurity.org/downloads/show-single/?file=ubuntu1404.100
# https://wiki.ubuntu.com/Security/Features
# https://help.ubuntu.com/community/StricterDefaults
#

FW_ADMIN="192.168.1.71"
SSH_GRPS="sudo"
FW_POLICY="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/net/firewall"
FW_SERVICE="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/hardening/config/firewall.service"
SYSCTL_CONF="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/sysctl.conf"
AUDITD_RULES="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/audit.rules"
VERBOSE="Y"
CHANGEME="ad" # Add something just to verify that you actually glanced the code

clear

if ! [ -x "`which systemctl`" ]
  then
    echo "systemctl required. Exiting."
    exit
fi

for s in `ls -1d ./scripts/[0-9_]*`; do
  . $s
done

echo

pre
firewall

checkreboot

echo