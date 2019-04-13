#!/bin/bash
unset HISTFILE

#stop logging services
echo "Stopping rsyslog" && sudo /bin/systemctl stop rsyslog 2>/dev/null
# enabling audit for next start
echo "Enabling auditd" && sudo /bin/systemctl enable audit 2>/dev/null
# yum create cache
# echo "Making yum cache" && sudo /usr/bin/yum -y makecache 2>/dev/null
# yum install deltarpm and yum-utils
# echo "Installing deltarpm and yum-utils" &&sudo /usr/bin/yum -y install deltarpm yum-utils 3>/dev/null
# upgrade
# echo "Updating system" && sudo /usr/bin/yum -y update 2>/dev/null
# remove old kernels
echo "Removing kernel bar one" && sudo /bin/package-cleanup -y --oldkernels --count=1 2>/dev/null
# clean yum
echo "Cleaning yum cache" && sudo /usr/bin/yum clean all 2>/dev/null

#force logrotate to shrink logspace and remove old logs as well as truncate logs
echo "Forcing logrotate" && sudo /usr/sbin/logrotate -f /etc/logrotate.conf 2>/dev/null
echo "Cleaning up logs - Part 1/9" && sudo /bin/rm -f /var/log/*-????????  /var/log/*.gz 2>/dev/null
echo "Cleaning up logs - Part 2/9" && sudo /bin/rm -f /var/log/dmesg.old  2>/dev/null
echo "Cleaning up logs - Part 3/9" && sudo /bin/rm -rf /var/log/anaconda  2>/dev/null
echo "Cleaning up logs - Part 4/9" && /bin/cat /dev/null | sudo tee /var/log/audit/audit.log 2>/dev/null
echo "Cleaning up logs - Part 5/9" && /bin/cat /dev/null | sudo tee /var/log/wtmp 2>/dev/null
echo "Cleaning up logs - Part 6/9" && /bin/cat /dev/null | sudo tee /var/log/lastlog 2>/dev/null
echo "Cleaning up logs - Part 7/9" && /bin/cat /dev/null | sudo tee /var/log/grubby 2>/dev/null
echo "Cleaning up logs - Part 8/9" && /bin/cat /dev/null | sudo tee /var/log/grubby_prune_debug 2>/dev/null
echo "Cleaning up logs - Part 9/9" && /bin/cat /dev/null | sudo tee /var/log/tuned/tuned.log 2>/dev/null
#remove udev hardware rules
echo "Removing custom udev rules" && sudo /bin/rm -f /etc/udev/rules.d/70* 2>/dev/null
#remove uuid from ifcfg scripts
echo "Removing UUIDs in efcfg" && sudo /bin/sed –i ‘/UUID/d’ /etc/sysconfig/network-scripts/ifcfg-* 2>/dev/null
#remove SSH host keys
echo "Removing ssh keys" && sudo /bin/rm -f /etc/ssh/*key* 2>/dev/null
#remove root users shell history and user history
echo "Removing User bash-history" && /bin/rm -f ~/.bash_history 2>/dev/null
echo "Removing ROOT bash-history" && sudo /bin/rm -f ~root/.bash_history 2>/dev/null
#remove root users SSH history
echo "Remove ROOT .ssh" && sudo /bin/rm -rf ~root/.ssh/ 2>/dev/null
#clean root dir
echo "Cleanup /root" && sudo rm -rf /root/* 2>/dev/null
# remove NetworkManager in CentOS 7. nothing to manage really.
echo "Removing NetworkManager" && rpm -qa | grep ^NetworkManager | xargs sudo yum -y erase 2>/dev/null
# remove wpa_supplicant as no wifi on server ;)
echo "Removing wpa_supplicant" && rpm -qa | grep ^wpa_sup | xargs sudo yum -y erase 2>/dev/null
# remove plymout as we need no fancy bootprompt
echo "Removing plymout" && rpm -qa | grep ^plymouth | xargs sudo yum -y erase 2>/dev/null

# mark as template
echo "Mark as template" && sudo touch /.unconfigured 2>/dev/null
# force relabeling at next systemstart
echo "Force relabeling at next restart" && sudo touch /.autorelabel 2>/dev/null
