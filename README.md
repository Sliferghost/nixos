# Install

## Enable WiFi

### Find Wireless interface

```bash
iwconfig
```

### Connect to WiFi

```bash
wpa_passphrase "Pick me Lara" | sudo tee /etc/wpa_supplicant.conf
wpa_supplicant -B -c /etc/wpa_supplicant.conf -i <wireless-interface>
```

## Clone github

```bash
git clone https://github.com/Sliferghost/nixos
```

## Format & mount the disks

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./game-pc-disk-config.nix
```

## Generate the config

```bash
sudo nixos-generate-config --root /mnt
```

## Install

```bash
sudo nixos-install
```

# Post Install

## Connecto to WiFi

```bash
nmcli device wifi connect "Pick me Lara" password "<password>"
```
