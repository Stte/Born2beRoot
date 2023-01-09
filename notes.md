Born2beRoot

export PATH=$PATH:/sbin

/sbin/init 6

ip addr

SSH
cat /etc/ssh/sshd_config

UFW
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-debian-11-243261243130246d443771547031794d72784e6b36656d4a326e49732e
apt install ufw
ufw allow 4242
ufw enable


Sudo
https://documentation.arcserve.com/Arcserve-UDP/Available/V6.5/ENU/Bookshelf_Files/HTML/Agent%20Online%20Help%20Linux/Content/AgentforLinuxUserGuide/udpl_config_sudo_debian.htm
apt install sudo
adduser tspoof sudo

?? https://techglimpse.com/dos-and-donts-of-sudo/


Group
groupadd user42
adduser tspoof user42


Login expiration
nano /etc/login.defs


Password length/complexity
https://www.server-world.info/en/note?os=Debian_10&p=password
https://www.networkworld.com/article/2726217/how-to-enforce-password-complexity-on-linux.html
https://www.xmodulo.com/set-password-policy-linux.html
apt install libpam-pwquality
nano /etc/pam.d/common-password
password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=8
apt install libpwquality-tools
pwscore
