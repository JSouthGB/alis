#!/usr/bin/env bash

echo "## environment ##"
tee -a /etc/environment <<EOF
#QT_QPA_PLATFORMTHEME=qt5gtk2
QT_QPA_PLATFORMTHEME=qt5ct
QT_STYLE_OVERRIDE=kvantum
BROWSER=firefox
EDITOR=micro
EOF

gpasswd -a devu video

echo "## backlight ##"
tee -a /etc/udev/rules.d/backlight.rules <<EOF
#ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /brightness", RUN+="/bin/chmod g+w /brightness"

RUN+="/bin/chgrp -R video /sys/class/backlight/nvidia_0/"
RUN+="/bin/chmod -R g+w /sys/class/backlight/nvidia_0/"
#RUN+="/bin/chown 1000 /sys/class/backlight/nvidia_0/"
EOF

echo "## mkdir fourt and x13"
mkdir /mnt/fourt
mkdir /mnt/x13

echo "## chown fourt AND x13"
chown -R devu:devu /mnt/fourt
chown -R devu:devu /mnt/x13

echo "## fuse ##"
sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

echo "## fstab ##"
tee -a /etc/fstab <<EOF
UUID=fa8d4ea2-fef8-474f-8c81-5fefc1cf34b0 /mnt/fourt xfs defaults,noatime 0 1

devu@10.0.0.6:/ /mnt/x13 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/devu/.ssh/id_rsa,allow_other,idmap=user,reconnect 0 0
EOF

echo "mount -a"
mount -a

echo "systemctl daemon-reload"
systemctl daemon-reload

echo "rclone copy -P /mnt/fourt/laptop.backup.1/sddm-theme-corners/corners/ /usr/share/sddm/themes/corners/"
rclone copy -P /mnt/fourt/laptop.backup.1/sddm-theme-corners/corners/ /usr/share/sddm/themes
echo "## sddm ##"
sed -i 's/Numlock=none/Numlock=on/g' /usr/lib/sddm/sddm.conf.d/default.conf
sed -i 's/Current=/NCurrent=corners/g' /usr/lib/sddm/sddm.conf.d/default.conf

echo "rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/Desktop/ /home/devu/Desktop/"
rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/Desktop/ /home/devu/Desktop/

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Downloads /home/devu/Downloads"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Downloads /home/devu/Downloads

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.local/share/fonts /home/devu/.local/share/fonts"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.local/share/fonts /home/devu/.local/share/fonts

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Pictures /home/devu/Pictures"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Pictures /home/devu/Pictures

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Documents /home/devu/Documents"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/Documents /home/devu/Documents

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.cache/thumbnails /home/devu/.cache/thumbnails"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.cache/thumbnails /home/devu/.cache/thumbnails

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.cache/mozilla /home/devu/.cache/mozilla"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.cache/mozilla /home/devu/.cache/mozilla

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.mozilla /home/devu/.mozilla"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.mozilla /home/devu/.mozilla

echo "rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.ssh /home/devu/.ssh"
rclone copy -P --check-first --max-backlog 2000000 --order-by size,mixed,50 --transfers 8 --checkers 48 /mnt/fourt/laptop.backup.1/home/devu/.ssh /home/devu/.ssh

echo "rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.config/background/ /home/devu/.config/background"
rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.config/background/ /home/devu/.config/background

echo "rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.config/zsh/ /home/devu/.config/zsh"
rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.config/zsh/ /home/devu/.config/zsh

echo "rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.zshenv /home/devu/.zshenv"
rclone copy -P /mnt/fourt/laptop.backup.1/home/devu/.zshenv /home/devu/.zshenv

echo "## chmod .ssh dir and files ##"
chmod 700 /home/devu/.ssh/
chmod 600 /home/devu/.ssh/id_ed25519
chmod 600 /home/devu/.ssh/id_rsa
chmod 600 /home/devu/.ssh/id_rsa.1
chmod 600 /home/devu/.ssh/id_rsa.2
chmod 600 /home/devu/.ssh/id_rsa.3

echo "## chmod polybar scripts"
chmod +x /home/devu/.config/polybar/material/launch.sh
chmod +x /home/devu/.config/polybar/material/scripts/launcher.sh
chmod +x /home/devu/.config/polybar/material/scripts/powermenu.sh
chmod +x /home/devu/.config/polybar/material/scripts/updates.sh

echo "## jetbrains toolbox ##"
rclone copy /mnt/fourt/laptop.backup.1/jetbrains-toolbox.appimage /home/devu
chmod +x /home/devu/jetbrains-toolbox-2.1.1.18388/

echo "## chown $HOME to user"
chown -R devu:devu /home/devu
