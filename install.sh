#!/bin/bash

#Update exploit papers
sudo searchsploit -u

#Updates

sudo apt update -y
sudo apt upgrade -y

#Extract rockyou.txt
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
sudo mkdir /usr/share/tools

#Misc
sudo apt install sherlock -y
sudo pip3 install pycryptodome
sudo pip3 install pyarmor
sudo pip3 install python-nmap
sudo pip3 install click
sudo apt install pip
sudo apt install mcrypt --fix-missing
sudo apt install mcrypt
sudo apt install libmcrypt-dev
sudo apt install libmhash-dev
sudo apt install libjpeg62-turbo8-dev
sudo apt install pip
sudo pip3 install pytransform
sudo apt install cmake
sudo apt install gedit


#Github Repos

sudo git clone https://github.com/nlscc/unpyarmor /usr/share/tools/unpyarmor
sudo git clone https://github.com/RickdeJager/stegseek /usr/share/tools/stegseek
sudo git clone https://github.com/danielmiessler/SecLists /usr/share/wordlists/SecLists
sudo git clone https://github.com/flozz/p0wny-shell /usr/share/tools/p0wny-shell
sudo git clone https://github.com/SecureAuthCorp/impacket /opt/impacket
sudo git clone https://github.com/ropnop/kerbrute /opt/kerbrute
sudo git clone https://github.com/tmux-plugins/tmux-logging/ /opt/tmux-logging/
sudo git clone https://github.com/21y4d/nmapAutomator /usr/share/tools/nmapAutomator
sudo git clone https://github.com/Tib3rius/AutoRecon /usr/share/tools/AutoRecon
sudo git clone https://github.com/praetorian-inc/Hob0Rules /usr/share/wordlists

#RockYou

sudo tar -xvf /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt.tar
sudo cp /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt /usr/share/wordlists/rockyou2021.txt

#UnPyarmor

sudo python3 /usr/share/tools/unpyarmor/setup.py install


#TMUX

sudo apt-get install tmux -y
touch ~/.tmux.conf
touch ~/.hushlogin
sudo curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.tmux.conf > ~/.tmux.conf

#Snap

sudo apt install snapd -y
sudo apt install apparmor.service -y
sudo apt install apparmor -y
sudo systemctl enable apparmor
sudo systemctl enable apparmor.service
sudo systemctl enable snapd
sudo systemctl start apparmor
sudo systemctl start apparmor.service
sudo systemctl start snapd
sudo systemctl restart apparmor
sudo systemctl restart apparmor.service
sudo systemctl restart snapd

sudo snap install discord
sudo snap install spotify
sudo snap install codium --classic

#obsidian

cd /tmp
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.13.19/obsidian_0.13.19_amd64.snap
sudo snap install /tmp/obsidian_0.13.19_amd64.snap --dangerous
cd ~


#iptables
sudo iptables -A INPUT -p tcp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"
sudo iptables -A INPUT -p udp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"
sudo iptables -A INPUT -p icmp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"

#You can view the logs in /var/log/messages

#bashrc/zshrc config
curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.bashrc > ~/.bashrc
curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.zshrc > ~/.zshrc

#smb config
sudo chmod +w /etc/samba/smb.conf
sudo curl https://github.com/Screptillian/Scripts/blob/main/smb.conf > /etc/samba/smb.conf

#google chrome

cd /tmp
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ~

#Firefox Add-Ons
firefox https://addons.mozilla.org/firefox/downloads/file/3890260/wappalyzer-6.9.11-fx.xpi
firefox https://addons.mozilla.org/firefox/downloads/file/3616824/foxyproxy_standard-7.5.1-an+fx.xpi

#docker for bloodhound

sudo apt install docker -y
sudo apt install ca-certificates -y
sudo apt install gnupg -y
sudo apt install lsb-release -y
sudo apt install curl -y

sudo apt install docker-ce -y
sudo apt install docker-ce-cli -y
sudo apt install containerd.io -y
sudo apt install docker.io -y

#Bloodhound

sudo docker pull specterops/bloodhound-neo4j
#alias bloodhound ='sudo docker run -p 7474:7474 -p 7687:7687 specterops/bloodhound-neo4j' (See bashrc/zshrc)

#cleanup
apt autoremove
#shutdown -r now
