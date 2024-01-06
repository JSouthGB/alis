#!/usr/bin/env bash

# tee -a /etc/environment <<EOF
# QT_QPA_PLATFORMTHEME=qt5ct
# QT_STYLE_OVERRIDE=kvantum
# BROWSER=firefox
# EDITOR=nano
# EOF

gpasswd -a devu video

tee -a /etc/udev/rules.d/backlight.rules <<EOF
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
EOF

# chmod +x .config/polybar/i3_bar.sh
# chmod +x .config/i3/scripts/power.sh
chmod +x /home/devu/.config/polybar/material/launch.sh
chmod +x /home/devu/.config/polybar/material/scripts/launcher.sh
chmod +x /home/devu/.config/polybar/material/scripts/powermenu.sh
chmod +x /home/devu/.config/polybar/material/scripts/updates.sh

mkdir /mnt/fourt
mkdir /mnt/x13

chown -R devu:devu /mnt/fourt
chown -R devu:devu /mnt/x13

sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

tee -a /etc/fstab <<EOF
UUID=fa8d4ea2-fef8-474f-8c81-5fefc1cf34b0 /mnt/fourt xfs defaults,noatime 0 1

#devu@10.0.0.6:/ /mnt/x13 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/devu/.ssh/id_rsa,allow_other,idmap=user,reconnect 0 0
EOF

mount -a
systemctl daemon-reload


rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/Desktop/ /home/devu/Desktop/

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Downloads /home/devu/Downloads

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Pictures /home/devu/Pictures

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Documents /home/devu/Documents

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.cache/thumbnails /home/devu/.cache/thumbnails

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.cache/mozilla /home/devu/.cache/mozilla

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.mozilla /home/devu/.mozilla

rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.ssh /home/devu/.ssh

rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.config/background/ /home/devu/.config/background

echo "chmod .ssh dir and files"
