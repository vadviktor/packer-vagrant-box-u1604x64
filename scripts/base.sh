#!/bin/bash

aptitude update && \
aptitude full-upgrade -y && \
aptitude install -y build-essential \
                    linux-generic \
                    linux-image-extra-virtual \
                    curl \
                    wget \
                    cifs-utils \
                    acl

sed -i -e 's/noatime,/noatime,acl,/g' /etc/fstab

echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
usermod -a -G sudo vagrant

echo "UseDNS no" >> /etc/ssh/sshd_config

echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf
echo "vm.swappiness = 1" >> /etc/sysctl.conf
