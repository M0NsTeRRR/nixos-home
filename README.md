# To do

First install setup
Luks encryption
Dual boot windows
Systemd-boot
Secureboot

# How to use this repo

These steps assume that you have already installed NixOS.

For documentation on how to complete a minimal NixOS install: [Minimal Install](minimal-install.md)

There are no inherent advantages to using the minimal installation as opposed to the GUI. If you want to enable LUKS without manually encrypting your drive, use the GUI.

   ### 1. Fetch the flake template

   ```bash
   nix --experimental-features 'nix-command flakes' flake new -t 'github:m0nsterrr/nixos-home' ./nixos-home && cd nixos-home
   ```

   ### 2. Generate a hardware-configuration.nix

   ```bash
   nix --experimental-features 'nix-command flakes' nixos-generate-config
   ```

   ```

   ### 4. Validate the flake imports went okay.

   ```bash
   nix --experimental-features 'nix-command flakes' flake check
   ```
   
   ### 5. Build the system. 

   ```bash
   sudo nixos-rebuild switch --flake '.#hostname'
   ```
   **OR if your `hostname` already matches the hostname specificed in the `flake.nix`.**
   ```bash
   sudo nixos-rebuild switch --flake .
   ```