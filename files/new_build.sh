#!/usr/bin/env bash

echo "## environment ##"
##for QT themes
tee -a /etc/environment <<EOF
#QT_QPA_PLATFORMTHEME=qt5gtk2
QT_QPA_PLATFORMTHEME=qt5ct
QT_STYLE_OVERRIDE=kvantum
BROWSER=firefox
EDITOR=micro
EOF

##for backlight control
gpasswd -a devu video

echo "## backlight ##"
tee -a /etc/udev/rules.d/backlight.rules <<EOF
##ACTION stopped working
#ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /brightness", RUN+="/bin/chmod g+w /brightness"

##chgrp/chmod works, chown seems excessive
RUN+="/bin/chgrp -R video /sys/class/backlight/nvidia_0/"
RUN+="/bin/chmod -R g+w /sys/class/backlight/nvidia_0/"
#RUN+="/bin/chown 1000 /sys/class/backlight/nvidia_0/"
EOF

echo "## mkdir onet and x13"
## for mounts
mkdir /mnt/onet
mkdir /mnt/x13

echo "## chown onet AND x13"
chown -R devu:devu /mnt/onet
chown -R devu:devu /mnt/x13

echo "## fuse ##"
sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

echo "## fstab ##"
tee -a /etc/fstab <<EOF
##secondary drive
UUID=0af48b82-e8df-4665-82f6-0988a2676c9a /mnt/onet ext4 defaults 0 0

##sshfs mount
#devu@10.0.0.6:/ /mnt/x13 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/devu/.ssh/id_rsa,allow_other,idmap=user,reconnect 0 0
EOF

echo "mount -a"
## to copy files
mount -a

# .config dirs
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/alacritty/ /home/devu/.config/alacritty/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/background/ /home/devu/.config/background/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/dunst/ /home/devu/.config/dunst/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/galculator/ /home/devu/.config/galculator/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/geeqie/ /home/devu/.config/geeqie/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/gtk-3.0/ /home/devu/.config/gtk-3.0/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/i3/ /home/devu/.config/i3/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/kde.org/ /home/devu/.config/kde.org/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/Kvantum/ /home/devu/.config/Kvantum/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/micro/ /home/devu/.config/micro/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/mpv/ /home/devu/.config/mpv/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/neofetch/ /home/devu/.config/neofetch/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/networkmanager-dmenu/ /home/devu/.config/networkmanager-dmenu/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/pavucontrol-qt/ /home/devu/.config/pavucontrol-qt/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/picom/ /home/devu/.config/picom/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/polybar/ /home/devu/.config/polybar/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/qt5ct/ /home/devu/.config/qt5ct/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/ranger/ /home/devu/.config/ranger/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/rclone/ /home/devu/.config/rclone/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/sqlitebrowser/ /home/devu/.config/sqlitebrowser/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/zsh/ /home/devu/.config/zsh/
# .config files
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/arkrc /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/dolphinrc /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/gwenviewrc /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/katemetainfos /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/katerc /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/katevirc /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/kiorc /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/mimeapps.list /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/user-dirs.dirs /home/devu/.config/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.config/user-dirs.locale /home/devu/.config/

# browsers
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.librewolf/ /home/devu/.librewolf/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.cache/librewolf/ /home/devu/librewolf/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.mozilla/ /home/devu/.mozilla/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.cache/mozilla/ /home/devu/mozilla/

# .local/share dirs
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/dolphin/ /home/devu/.local/share/dolphin/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/fonts/ /home/devu/.local/share/fonts/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/kate/ /home/devu/.local/share/kate/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/kxmlgui5/ /home/devu/.local/share/kxmlgui5/
# .local/share files
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/user-places.xbel /home/devu/.local/share/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/user-places.xbel.bak /home/devu/.local/share/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.local/share/user-places.xbel.tbcache /home/devu/.local/share/

# .ssh
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.ssh/ /home/devu/.ssh/

# user dirs
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/Desktop/ /home/devu/Desktop/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/Documents/ /home/devu/Documents/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/Downloads/ /home/devu/Downloads/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/Pictures/ /home/devu/Pictures/

# ~/ files
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.xinitrc /home/devu/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.Xresources /home/devu/
rsync -aAXH --info=progress2 /mnt/onet/desk.test/home/devu/.zshenv /home/devu/

# rsync -aAXH --info=progress2 /usr/share/color-schemes/
# rsync -aAXH --info=progress2 /usr/share/icons/
# rsync -aAXH --info=progress2 /usr/share/Kvantum/
# rsync -aAXH --info=progress2 /usr/share/themes/

rsync -aAXH --info=progress2 /mnt/onet/desk.test/jetbrains-toolbox /home/devu/

echo "## export GPG_TTY=$(tty)"
export GPG_TTY=$(tty)
