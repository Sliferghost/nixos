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

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./game-pc-disk-config.nix
```
