# Info

# Install

1. Flash NixOS ISO Image to an USB stick
2. Boot into it
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
4. Fetch the flake template

   ```bash
   nix --experimental-features 'nix-command flakes' flake new -t github:m0nsterrr/nixos-home ./nixos-home && cd nixos-home
   ```

4. Partition the system

   ```bash
   sudo nix --experimental-features 'nix-command flakes' run github:nix-community/disko -- --mode disko system/hosts/<hostname>/disko.nix
   ```

5. Generate a hardware-configuration.nix

   ```bash
   sudo nixos-generate-config --root /mnt
   ```

6. Build the system

   ```bash
   sudo nixos-install
   ```

7. Update nixos password to be able to login after reboot with `passwd`

8. Reboot (be sure to turn off secureboot as it's not configured yet but in setup mode to be able to enroll key)

9. Follow [Lanzaboot quickstart](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md)

9. Update nixos config as needed
   ```bash
   sudo nixos-rebuild switch --flake 'github:m0nsterrr/nixos-home#<hostname>'
   ```

10. 

# Update
   If you need to update the configuration at anytime.

   ```bash
   sudo nixos-rebuild switch --flake 'github:m0nsterrr/nixos-home'
   ```
