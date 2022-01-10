#!/bin/bash

sudo searchsploit -u


"""
sudo apt update -Y && sudo apt upgrade -Y

sudo unzip /usr/share/wordlists/rockyou.txt /usr/share/wordlists/rockyou.txt
sudo mkdir /usr/share/tools


sudo git clone https://github.com/danielmiessler/SecLists /usr/share/wordlists

sudo git clone https://github.com/flozz/p0wny-shell /usr/share/tools/

sudo git clone https://github.com/SecureAuthCorp/impacket /opt/

sudo git clone https://github.com/ropnop/kerbrute /opt/

sudo git clone https://github.com/tmux-plugins/tmux-logging/ /opt/

sudo git clone https://github.com/21y4d/nmapAutomator /opt/

sudo git clone https://github.com/Tib3rius/AutoRecon /opt/

sudo apt-get install tmux -Y
touch ~/.tmux.conf
touch ~/.hushlogin



echo "set -q prefix C-a" >> ~/.tmux.conf
echo "bind C-a send-prefix" >> ~/.tmux.conf
echo "unbind C-b" >> ~/.tmux.conf
echo "bind-key j command-prompt -p "join pane from:" "join-pane -s '%%'"" >> ~/.tmux.conf
echo "bind-key s command-prompt -p "send pane to:" "join-pane -t '%%'"" >> ~/.tmux.conf
echo "set-window-option -g mode-keys vi" >> ~/.tmux.conf
echo "run-shell /opt/tmux-logging/logging.tmux" >> ~/.tmux.conf

sudo apt install snapd -Y
sudo apt install apparmor.service -Y
sudo apt install apparmor -Y
sudo systemctl enable apparmor
sudo systemctl enable apparmor.service
sudo systemctl enable snapd
sudo systemctl start apparmor
sudo systemctl start apparmor.service
sudo systemctl start snapd
sudo systemctl restart apparmor
sudo systemctl restart apparmor.service
sudo systemctl restart snapd

snap install discord
snap install spotify
snap install codium --classic
snap install obsidian --dangerous

sudo apt install codium -Y

iptables -A INPUT -p tcp,udp,icmp -m state --state NEW -j LOG --log-prefix "IPTables New-Connection:"

curl https://raw.githubusercontent.com/Screptillian/Scripts/main/.bashrc > ~/.bashrc

curl https://github.com/Screptillian/Scripts/blob/main/.zshrc > ~/.zshrc

curl https://github.com/Screptillian/Scripts/blob/main/smb.conf > /etc/samba/smb.conf

sudo apt install docker

mkdir -r /opt/bloodhound/data

git clone https://github.com/belane/docker-bloodhound /opt/bloodhound

mkdir /opt/bloodhound/docker-bloodhound/data

docker build /opt/bloodhound/docker-bloodhound -t bloodhound --build-arg neo4j=3.4.8 --build-arg bloodhound=2.1.0
docker run -it /opt/bloodhound/docker-bloodhound -e DISPLAY=unix$DISPLAY -v /tmp/X11-unix:/tmp/.X11-unix \ --device=/dev/dri/dev/dri \ -v /opt/bloodhound/docker-bloodhound/data:/data \ --name bloodhound bloodhound
docker start bloodhound

"""
