# Raspberry Zero multi USB gadget

Setup Script for Raspberry Zero multi-gadget USB-stick

## Getting Started

1. Download Raspbian or Raspbian lite
2. Flash Raspbian to SD-Card with `dd`
3. Mount boot partition from SD-Card
4. Create a empty file called `ssh` in the mounted boot partition
5. Create a file named `wpa_supplicant.conf` in the mounted boot partition:

```
country=de
update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
 scan_ssid=1
 ssid="WLAN_NAME"
 psk="WLAN_PASSWORD"
}
```

6. Eject, Insert and Boot.
7. Get Raspberry IP from your router web interface.
8. Use `ssh pi@PI_IP_ADDRESS` with password `raspberry` to connect to the Pi.
9. Change Password with `passwd`
10. Install git: `sudo apt update && sudo apt install git`
11. Clone this repository: `git clone https://github.com/niki-on-github/Raspberry-USB-Gadget.git`
12. Adjust configuration in `./files/etc/raspi2go.conf`
13. Setup multi USB gadget with `sudo bash install.sh`
14. Reboot Pi with `sudo reboot`


## Use USB Ethernet gadget

Only work if you have activated the `USB_ETHERNET` function in `/etc/raspi2go.conf`.

1. Wait for a new Wired Connection in the network manager applet. Then set in IPv4-Settings the method to: `Shared to other computers`
2. reconnect your pi
3. Wait a view seconds and look at the `arp` table. A new entry with `10.42.0.X` should appear.
4. Use `ssh` with this IP to connect to the Pi via USB.

Optional: open the file `/etc/network/interfaces` on the Pi as root, and add the lines:
```
allow-hotplug usb0

iface usb0 inet static
    address 10.42.0.2
    netmask 255.255.255.0
    network 10.42.0.0
    broadcast 10.42.0.255
    gateway 10.42.0.1
```
Now the IP do not change if you reconnect or restart the Pi.
