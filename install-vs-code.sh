#!/bin/bash

echo "Installing VS Code - D.Sutton"

# Install dependencies
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

# Import Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/

# Add VS Code repo
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update and install
sudo apt update
sudo apt install code
