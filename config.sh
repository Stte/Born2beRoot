#!/bin/bash

echo "Starting config..."
apt update
export PATH=$PATH:/usr/sbin

echo "SSH..."
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bkup
cp sshd_config /etc/ssh/sshd_config
systemctl restart sshd

echo "UFW..."
apt install ufw -y
ufw allow 4242
ufw enable

echo "Sudo..."
apt install sudo -y
cp sudoconf /etc/sudoers.d/sudoconf
usermod -a -G sudo tspoof

echo "Groups..."
groupadd user42
usermod -a -G user42 tspoof

echo "Password..."
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

echo "Monitoring..."
apt install sysstat -y
cp monitoring.sh /usr/local/bin/monitoring.sh

echo "Remember to configure cron (crontab -e and */10 * * * * /usr/local/bin/monitoring.sh)"
echo "and after that reboot (systemctl reboot)"
