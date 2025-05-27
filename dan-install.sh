#goto desktop
cd ~/Desktop

#disconnect from current Wifi
#sudo  nmcli con down MyRepublic\ 239D

#connect to wifi
sudo nmcli device wifi connect MyRepublic\ 239D password 8qt3vz3g7a



# install repositry sources/keys




#dependencies
sudo apt install software-properties-common 
sudo apt install apt-transport-https 
sudo apt install gdebi-core
sudo apt install python3-pip

#for sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list


#for vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'




#update system
sudo apt update
sudo apt upgrade



#install apps
#sudo apt install refind

sudo apt install curl
sudo apt install aptitude 
sudo apt install synaptic 
sudo apt install git 
sudo apt install openssh-server
sudo apt install neofetch
sudo apt install wttr
#sudo apt install conky
#sudo apt install kicad
#sudo apt install fritzing
sudo apt install sublime-text
sudo snap install snap-store
sudo snap install chromium
sudo snap install chromium-ffmpeg
sudo snap install btop
sudo snap install spotify-qt

#install rust
curl https://sh.rustup.rs -sSf | sh
#exec bash

#install dependancies for libraspot
sudo apt-get install build-essential libasound2-dev

#install librespot - client service to connect to spotify
cargo install librespot



#fritzing


if type "git-credential-manager" > /dev/null; then
  echo "GCM exists. Skipping Install."
else
  echo "GCM does not exist. Installing GCM."
#Git GCM
sudo wget -O gcm.deb https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.935/gcm-linux_amd64.2.0.935.deb
sudo dpkg -i gcm.deb
git-credential-manager configure
rm gcm.deb

#Configure Git to use GCM
git config --global credential.credentialStore plaintext

fi

# install github desktop
if type "github-desktop" > /dev/null; then
  echo "github-desktop exists. Skipping Install."
else
  echo "github-desktop does not exist. Installing GCM."

sudo wget -O GHD.deb https://github.com/shiftkey/desktop/releases/download/release-3.1.1-linux1/GitHubDesktop-linux-3.1.1-linux1.deb
sudo gdebi GHD.deb
rm GHD.deb

fi

# install discord
if type "discord" > /dev/null; then
  echo "discord exists. Skipping Install."
else
  echo "discord does not exist. Installing GCM."

sudo wget -O discord.deb https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb
sudo gdebi discord.deb
rm discord.deb

fi


#list of apps to add


#install vscode
if type "code" > /dev/null; then
  echo "vscode exists. Skipping Install"
else
  echo "vscode does not exist. Installing vscode."
sudo apt-get -f install code

code --install-extension platformio.platformio-ide
code --install-extension ms-vscode.cpptools-extension-pack

fi


if type "conky-manager" > /dev/null; then
  echo "conky manager exists. Skipping Install"
else
  echo "conky manager does not exist. Installing vscode."
wget http://launchpadlibrarian.net/340091846/realpath_8.26-3ubuntu4_all.deb https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.deb

sudo dpkg -i realpath_8.26-3ubuntu4_all.deb conky-manager-v2.4-amd64.deb

sudo apt -f install

sudo rm realpath_8.26-3ubuntu4_all.deb conky-manager-v2.4-amd64.deb

fi

#goto desktop
cd ~/Desktop

#check if github dir exists
DIR="Github"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "${DIR} Exists. Will not install anything"
else
#install git directory
    echo "Creating Github Directory on desktop"
mkdir Github

cd Github
#pull latest development build of gameboard project
 echo "Cloning Gameboard"
git clone https://github.com/DanielDoesDesign/GameBoard
 echo "Cloning PRIZM"
git clone https://github.com/DanielDoesDesign/PRIZM
fi

#pull folder of bits and bobs

#DanielDoesDesign
#jpBt2u4Edg9mCcu0


#INPUT: do you want to check on the services? SSH etc
#check ssh is running
#sudo systemctl status ssh

#open firewall
#sudo ufw allow ssh


#recheck all newly install apps are at their latest version
sudo apt upgrade




