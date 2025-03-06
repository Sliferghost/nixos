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

# Bluetooth

## Connect with Keychron Keyboard over bluetooth

1. Remove the keyboard from known bluetooth devices if it’s there.
2. Hold Fn+[1-3] to start pairing with the keyboard
3. In blueman-manager press “Search” (or type scan on in bluetoothctl)
4. DO NOT CONNECT THE DEVICE, pair it instead. Right click on device in blueman-manager and select “Pair” (or type pair <mac> in bluetoothctl)
5. Pairing takes a couple of seconds after which keyboard disconnects. Wait until it fully disconnects
6. Now, connect the keyboard. Double click it in blueman-manager (or connect <mac> in bluetoothctl)
7. After keyboard is connected, make it “trusted”. Right click the device in blueman-manager and select “Trusted” (or trust <mac> in bluetoothctl)
