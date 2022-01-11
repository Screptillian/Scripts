#!/bin/bash

#Update exploit papers
sudo searchsploit -u

#Updates

sudo apt update -y
sudo apt upgrade -y

#Extract rockyou.txt
sudo unzip /usr/share/wordlists/rockyou.txt /usr/share/wordlists/rockyou.txt
sudo mkdir /usr/share/tools

#Github Repos

sudo git clone https://github.com/danielmiessler/SecLists /usr/share/wordlists/SecLists
sudo git clone https://github.com/flozz/p0wny-shell /usr/share/tools/p0wny-shell
sudo git clone https://github.com/SecureAuthCorp/impacket /opt/impacket
sudo git clone https://github.com/ropnop/kerbrute /opt/kerbrute
sudo git clone https://github.com/tmux-plugins/tmux-logging/ /opt/tmux-logging/
sudo git clone https://github.com/21y4d/nmapAutomator /usr/share/tools/nmapAutomator
sudo git clone https://github.com/Tib3rius/AutoRecon /usr/share/tools/AutoRecon

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
sudo snap install obsidian --dangerous


#Codium v2
sudo apt install codium -y

#iptables
iptables -A INPUT -p tcp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"
iptables -A INPUT -p udp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"
iptables -A INPUT -p icmp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"


#bashrc/zshrc config
curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.bashrc > ~/.bashrc
curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.zshrc > ~/.zshrc

#smb config
sudo chmod +w /etc/samba/smb.conf
sudo curl https://github.com/Screptillian/Scripts/blob/main/smb.conf > /etc/samba/smb.conf

#docker for bloodhound

sudo apt install docker -y
sudo apt install ca-certificates -y
sudo apt install gnupg -y
sudo apt install lsb-release -y
sudo apt install curl -y

sudo  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo apt update
sudo apt install docker-ce -y
sudo apt install docker-ce-cli -y
sudo apt install containerd.io -y
sudo apt install docker.io -y


sudo mkdir -r /opt/bloodhound/data

sudo docker pull specterops/bloodhound-neo4j
#sudo docker run -p 7474:7474 -p 7687:7687 specterops/bloodhound-neo4j

#cleanup
apt autoremove
#shutdown -r now
