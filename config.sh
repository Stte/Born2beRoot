#!/bin/bash

echo "Starting config..."
# apt update
# export PATH=$PATH:/usr/sbin

echo "Setting up SSH..."
# mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bkup
# cp sshd_config /etc/ssh/sshd_config
# systemctl restart ssh

echo "Setting up UFW..."
# apt install ufw
# ufw allow 4242
# ufw enable











echo "Reboot..."
# systemctl reboot

## check after reboot
# systemctl status ufw
# systemctl status ssh