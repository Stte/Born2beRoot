#!/bin/bash

echo "Starting config..."
apt update
export PATH=$PATH:/usr/sbin

echo "Setting up SSH..."
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bkup
cp sshd_config /etc/ssh/sshd_config
systemctl restart ssh

echo "Setting up UFW..."
apt install ufw
ufw allow 4242
ufw enable

echo "Setting up sudo..."
cp sudoconf /etc/sudoers.d/sudoconf

echo "Password"
apt install libpam-pwquality libpwquality-tools -y
mv /etc/login.defs /etc/login.defs.bkup
cp login.defs /etc/login.defs
mv /etc/pam.d/common-password /etc/pam.d/common-password.bkup
cp common-password /etc/pam.d/common-password
mv /etc/security/pwquality.conf /etc/security/pwquality.conf.bkup
cp pwquality.conf /etc/security/pwquality.conf
chage --maxdays 30 tspoof
chage --mindays 2 tspoof
chage --warndays 7 tspoof
chage --maxdays 30 root
chage --mindays 2 root
chage --warndays 7 root





echo "Reboot..."
# systemctl reboot

## check after reboot
# systemctl status ufw
# systemctl status ssh
