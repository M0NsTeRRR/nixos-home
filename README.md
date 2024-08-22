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

4. Partition the system

   ```bash
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake github:m0nsterrr/nixos-home/system/hosts/<hostname>/disko.nix
   ```

5. Generate a hardware-configuration.nix

   ```bash
   nixos-generate-config --no-filesystems --dir /mnt
   ```

6. Build the system

   ```bash
   sudo nixos-install --flake '.#<hostname>'
   ```

7. Reboot

8. Update nixos config as needed

# Update

1. Fetch the flake template

    ```bash
    nix --experimental-features 'nix-command flakes' flake new -t github:m0nsterrr/nixos-home ./nixos-home && cd nixos-home
    ```

2. Update nixos config
   ```bash
   sudo nixos-rebuild switch --flake '.#<hostname>'
   ```

   **OR if your `hostname` already matches the hostname specificed in the `flake.nix`.**

   ```bash
   sudo nixos-rebuild switch --flake .
   ```
