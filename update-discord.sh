#!/bin/bash

# Variables
DISCORD_URL="https://discord.com/api/download?platform=linux&format=tar.gz"
TEMP_DIR="/tmp/discord_update"
INSTALL_DIR="/opt/discord"
BIN_LINK="/usr/bin/discord"
DESKTOP_ENTRY="/usr/share/applications/discord.desktop"

# Ensure wget is installed
command -v wget >/dev/null 2>&1 || { echo "wget not found, installing..."; sudo pacman -Sy wget --noconfirm; }

# Stop any running instance of Discord
echo "Stopping Discord..."
pkill Discord 2>/dev/null

# Remove old installation
echo "Removing old Discord..." 
sudo rm -rf "$INSTALL_DIR"

# Create temp directory
mkdir -p "$TEMP_DIR"

# Download latest Discord tar.gz
echo "Downloading latest Discord..."
wget -O "$TEMP_DIR/discord.tar.gz" "$DISCORD_URL"

# Verify download
if [ ! -f "$TEMP_DIR/discord.tar.gz" ]; then
    echo "Download failed! Exiting."
    exit 1
fi

# Extract files
echo "Extracting Discord..."
tar -xvzf "$TEMP_DIR/discord.tar.gz" -C "$TEMP_DIR"

# Move new Discord to /opt
echo "Installing new Discord..."
sudo mv "$TEMP_DIR/Discord" "$INSTALL_DIR"

# Create symlink
sudo ln -sf "$INSTALL_DIR/Discord" "$BIN_LINK"

# Cleanup
rm -rf "$TEMP_DIR"

# Create/Update .desktop file
echo "Creating/updating Discord desktop entry..."
sudo bash -c "cat > $DESKTOP_ENTRY" <<EOL
[Desktop Entry]
Name=Discord
Comment=All-in-one voice and text chat for gamers
Exec=$INSTALL_DIR/Discord
Icon=$INSTALL_DIR/discord.png
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupWMClass=discord
EOL

echo "Discord has been updated successfully!"
