# arch-discord-updater

A simple Bash script for Arch Linux that automatically downloads, installs, and updates Discord to the latest release.

## Features

- Stops any running Discord instance  
- Removes old installation under `/opt/discord`  
- Downloads the official Discord tarball  
- Installs Discord into `/opt/discord`  
- Creates or updates a desktop entry (`.desktop`)  
- Creates a `/usr/bin/discord` symlink for easy launching  

## Prerequisites

- Arch Linux or an Arch‑based distro  
- `bash`, `wget`, `tar`  
- `sudo` privileges  

## Installation

1. Clone this repo:  
   ```bash
   git clone https://github.com/opsec-bot/arch-discord-updater.git
   cd arch-discord-updater
   ```

2. Make the script executable:  
   ```bash
   chmod +x update-discord.sh
   ```

3. (Optional) Move it into your PATH:  
   ```bash
   sudo mv update-discord.sh /usr/local/bin/discord-update
   ```

## Usage

- **Manual update**  
  ```bash
  discord-update
  ```
  Pulls the latest Discord release and installs it under `/opt/discord`.

- **Automate via cron**  
  Open your user crontab:  
  ```bash
  crontab -e
   ```
  Add a line to run daily at 3 AM:  
  ```
  0 3 * * * /usr/local/bin/discord-update >/dev/null 2>&1
  ```

## Uninstallation

1. Remove the Discord install folder:  
   ```bash
   sudo rm -rf /opt/discord
   ```

2. Remove the launcher symlink:  
   ```bash
   sudo rm /usr/bin/discord
   ```

3. Remove the desktop entry:  
   ```bash
   sudo rm /usr/share/applications/discord.desktop
   ```

4. (Optional) Remove the updater script:  
   ```bash
   sudo rm /usr/local/bin/discord-update
   ```

## Contributing

1. Fork the repo  
2. Create a feature branch (`git checkout -b feature/my-feature`)  
3. Commit your changes (`git commit -m "Add my feature"`)  
4. Push to your branch (`git push origin feature/my-feature`)  
5. Open a pull request

Please keep changes focused and follow existing code style.
