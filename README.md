# Install

## Classic

1. Flash NixOS ISO Image to an USB stick
2. Boot into it (be sure to turn off secureboot as it's not configured yet but in setup mode to be able to auto enroll key)
3. Setup wifi (if needed)
    1. Start wpa_supplicant > `systemctl start wpa_supplicant`
    2. Enable a wireless network > `wpa_cli`

        ```
        add_network 0
        set_network 0 ssid "SSID"
        set_netwwork 0 psk "PSK"
        set_network 0 key_mgmt WPA-PSK
        enable_network 0
        ```

4. Ensure you fullfill the steps required to run nixos-anywhere https://nix-community.github.io/nixos-anywhere/quickstart.html#steps-required-to-run-nixos-anywhere
5. Install NixOS

   ```bash
   export NIX_CONFIG="experimental-features = nix-command flakes"
   nix run github:nix-community/nixos-anywhere -- --flake github:m0nsterrr/nixos-home#<hostname> --target-host root@<ip address>
   ```

6. Reboot, login with `lortega` user with password `temp123` and don't forget to change it !🥳

## WSL

Install Windows Terminal and [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads).
Enable WSL2, download the latest [NixOS release](https://github.com/nix-community/NixOS-WSL/releases), and execute the downloaded file. Once it's installed, restart WSL with `wsl --shutdown`, open a new shell, and complete the installation:

```bash
sudo nix-channel --update
sudo nixos-rebuild switch
```

[Change your username](https://nix-community.github.io/NixOS-WSL/how-to/change-username.html) and run:

```bash
cd ~
nix-shell -p git
nix --experimental-features 'nix-command flakes' flake new -t github:m0nsterrr/nixos-home ./nixos-home
cd nixos-home
sudo nixos-rebuild switch --flake '.#wsl'
```

### Use SSH-agent and gpg key from your windows host

Install SSH client from winget  winget install "openssh beta" (it can causes error using old version)
Enable ssh-agent on windows and share UserProfile and ProgramFiles env var to WSL2, open powershell prompt with admin right

```powershell
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
setx WSLENV 'ProgramFiles/up:USERPROFILE/up'
```

Install niperelay on windows

```
# Using WinGet
winget install npiperelay

# Or using Chocolatey
choco install npiperelay

# Or using a binary in %USERPROFILE%\.wsl
# for example : https://github.com/rupor-github/wsl-ssh-agent
```

Enable ssh agent support for OpenSSH on keepassXC

# Update

   If you need to update the configuration at anytime.

   ```bash
   sudo nixos-rebuild switch --flake github:m0nsterrr/nixos-home#<hostname>
   ```

# Update dependencies

   ```bash
   nix flake update
   ```

# Import static config

Import your GPG keys

```bash
gpg --import < priv.asc
gpg --import < pub.asc
gpg --import-ownertrust < trust.asc
```

Some static files must be manually setup :

- `~/cifs/credentials`
- `~/wireguard-keys/homelab.peer`
- `~/.kube/static-kubeconfigs/<files>`
- `~/passwords.kdbx`
- `~/.aws/credentials`
