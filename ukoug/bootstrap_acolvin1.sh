#!/bin/bash

### ---- Send stdout, stderr to /var/log/messages/
exec 1> >(logger -s -t $(basename $0)) 2>&1

### ---- Enable OCI utilities daemon
systemctl enable ocid.service
systemctl start ocid.service

### ---- Apply updates to Linux OS and reboot
### ---- (disabled to save time during lab)
#yum update -y
#reboot
