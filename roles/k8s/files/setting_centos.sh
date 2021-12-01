#!/bin/bash
swapoff -a
echo 0 > /proc/sys/vm/swappines
sed -e '/swap/ s/^#*/#/' -i /etc/fstab
systemctl disable --now firewalld
setenforce 0 && sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config