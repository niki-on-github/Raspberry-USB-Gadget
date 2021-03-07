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
8. Use `ssh pi@PI_IP_ADDRESS` with password `raspberry` to connet to the Pi.
9. Change Password with `passwd`
10. Install git: `sudo apt update && sudo apt install git`
11. Clone this repository: `git clone https://github.com/niki-on-github/Raspberry-USB-Gadget.git`
12. Adjust configuration in `./files/etc/raspi2go.conf`
13. Setup multi USB gadget with `sudo bash install.sh`
14. Reboot Pi with `sudo reboot`
