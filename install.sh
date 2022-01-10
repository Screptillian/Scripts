#!/bin/bash

sudo searchsploit -u

sudo apt update -y
sudo apt upgrade -y

sudo unzip /usr/share/wordlists/rockyou.txt /usr/share/wordlists/rockyou.txt
sudo mkdir /usr/share/tools


sudo git clone https://github.com/danielmiessler/SecLists /usr/share/wordlists

sudo git clone https://github.com/flozz/p0wny-shell /usr/share/tools/

sudo git clone https://github.com/SecureAuthCorp/impacket /opt/

sudo git clone https://github.com/ropnop/kerbrute /opt/

sudo git clone https://github.com/tmux-plugins/tmux-logging/ /opt/

sudo git clone https://github.com/21y4d/nmapAutomator /opt/

sudo git clone https://github.com/Tib3rius/AutoRecon /opt/

sudo apt-get install tmux -y
touch ~/.tmux.conf
touch ~/.hushlogin



echo "set -q prefix C-a" >> ~/.tmux.conf
echo "bind C-a send-prefix" >> ~/.tmux.conf
echo "unbind C-b" >> ~/.tmux.conf
echo "bind-key j command-prompt -p "join pane from:" "join-pane -s '%%'"" >> ~/.tmux.conf
echo "bind-key s command-prompt -p "send pane to:" "join-pane -t '%%'"" >> ~/.tmux.conf
echo "set-window-option -g mode-keys vi" >> ~/.tmux.conf
echo "run-shell /opt/tmux-logging/logging.tmux" >> ~/.tmux.conf

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

sudo apt install codium -y

iptables -A INPUT -p tcp,udp,icmp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"

curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.bashrc > ~/.bashrc

curl https://github.com/Screptillian/Scripts/blob/main/.zshrc > ~/.zshrc

curl https://github.com/Screptillian/Scripts/blob/main/smb.conf > /etc/samba/smb.conf

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
sudo docker run -p 7474:7474 -p 7687:7687 specterops/bloodhound-neo4j

apt autoremove
#shutdown -r now
