#!/bin/bash

aptitude autoclean -y

echo "cleaning up dhcp leases"
rm -rf /var/lib/dhcp/*
