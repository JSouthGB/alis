# alis - All credit to [@picodotdev](https://github.com/picodotdev/alis)
This is a fork of [https://github.com/picodotdev/alis](https://github.com/picodotdev/alis)

![Arch Linux](https://raw.githubusercontent.com/JSouthGB/alis/master/images/archlinux-badge.svg)
![Bash](https://raw.githubusercontent.com/JSouthGB/alis/master/images/sh-bash-badge.svg)
![Shellcheck](https://github.com/JSouthGB/alis/actions/workflows/shellcheck.yml/badge.svg)

## System installation

Download and boot from the latest <a href="https://www.archlinux.org/download/">original Arch Linux installation media</a>. After boot use the following commands to start the installation.

Follow the <a href="https://wiki.archlinux.org/title/Arch_Linux">Arch Way</a> of doing things and learn what this script does. This will allow you to know what is happening.

Internet connection is required, with wireless WIFI connection see <a href="https://wiki.archlinux.org/title/Wireless_network_configuration#Wi-Fi_Protected_Access">Wireless_network_configuration</a> to bring up WIFI connection before start the installation.

**Minimum usage**

```
#                         # Start the system with latest Arch Linux installation media
# loadkeys [keymap]       # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# curl -sL https://raw.githubusercontent.com/JSouthGB/alis/master/download.sh | bash     # Download alis scripts
# vim alis.conf           # Edit configuration and change variables values with your preferences (system configuration)
# ./alis.sh               # Start installation
```

**Advanced usage**

```
#                         # Start the system with latest Arch Linux installation media
# loadkeys [keymap]       # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"          # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.
# curl -sL https://raw.githubusercontent.com/JSouthGB/alis/master/download.sh | bash     # Download alis scripts
# # curl -sL https://git.io/JeaH6 | bash                                                   # Alternative download URL with URL shortener
# # curl -sL https://raw.githubusercontent.com/JSouthGB/alis/master/download.sh | bash -s -- -h [HASH_COMMIT] # Use specific version of the script based on the commit hash
# ./alis-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis.conf           # Edit configuration and change variables values with your preferences (system configuration)
# vim alis-packages.conf  # (Optional) Edit configuration and change variables values with your preferences (packages to install)
#                         # (The preferred way to install packages is after system installation, see Packages installation)
# ./alis.sh               # Start installation
# ./alis-reboot.sh        # (Optional) Reboot the system, only necessary when REBOOT="false"
```

## Package installation

After the base Arch Linux system is installed, alis can install packages with pacman, Flatpak, SDKMAN and from AUR.

```
#                                  # After system installation start a user session
# curl -sL https://raw.githubusercontent.com/JSouthGB/alis/master/download.sh | bash     # Download alis scripts
# # curl -sL https://git.io/JeaH6 | bash                                                   # Alternative download URL with URL shortener
# ./alis-packages-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis-packages.conf           # Edit configuration and change variables values with your preferences (packages to install)
# ./alis-packages.sh               # Start packages installation
```

## Recovery

Boot from the latest <a href="https://www.archlinux.org/download/">original Arch Linux installation media</a>. After boot use the following commands to start the recovery, this will allow you to enter in the arch-chroot environment.

```
#                                  # Start the system with latest Arch Linux installation media
# loadkeys [keymap]                # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"          # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.
# curl -sL https://raw.githubusercontent.com/JSouthGB/alis/master/download.sh | bash     # Download alis scripts
# # curl -sL https://git.io/JeaH6 | bash                                                   # Alternative download URL with URL shortener
# ./alis-recovery-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis-recovery.conf           # Edit configuration and change variables values with your last installation configuration with alis (mainly device and partition scheme)
# ./alis-recovery.sh               # Start recovery
# ./alis-recovery-reboot.sh        # Reboot the system
```

## SSH install and cloud-init

SSH install and cloud-init allows to install Arch Linux unattended and automated way in local virtual machines and cloud environments.

Build the cloud-init ISO, mount it in the VM along side the official Arch Linux installation media, start the VM and get its IP address.

```
$ ./alis-cloud-init-iso.sh
```

SSH to the VM.

```
$ ./alis-cloud-init-ssh.sh -i "${IP_ADDRESS}"
```

Or, start a unattended installation with the provided configuration.

```
$ ./alis-cloud-init-ssh.sh -i "${IP_ADDRESS}" -c "alis-config-efi-ext4-systemd.sh"
```