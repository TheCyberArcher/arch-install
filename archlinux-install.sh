#!/bin/sh

sudo pacman -Syyuu

########### Driver installation ########### 

sudo pacman –S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-tools

########### session manager ########### 

yay -S sddm

########### Windows Manager ########### 

yay -S qtile qtile-extras cava psutils picom python-dbus-next

########### App launcher ########### 

yay -S rofi

########### System dependancies ###########

yay -S networkmanager networkmanager-applet firewalld lxpolkit gnome-keyring ddcutil pacman-contrib reflector

########### Filemanager ###########

yay -S thunar gvfs tumbler ffmpegthumbnailer lxappearance

########### Applications ###########

yay -S alacritty librewolf-bin torbrowser-launcher thunderbird protonmail-bridge-bin solaar keepassxc qbittorrent btop visual-studio-code-bin corectrl vlc discord signal-desktop neofetch eog redshift

########### Gaming ###########

yay -S steam lutris proton-ge-custom-bin

sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader winetricks

########### Virtualisation ###########

yay -S virtualbox virtualbox-host-modules-arch

########### Flatpak apps ###########

yay -S flatpak
flatpak install flathub com.protonvpn.www
flatpak install flathub io.github.mimbrero.WhatsAppDesktop

########### visual theme install ###########

git clone https://github.com/cbrnix/Flatery.git ~/.Flatery
cd ~/.Flatery
bash ./install.sh
rm -rf ~/.Flatery

########## Network Configuration ##########


nmcli con mod "Connexion filaire 1" ipv4.ignore-auto-dns yes
nmcli con mod "Connexion filaire 1" ipv4.dns "45.90.28.250 45.90.30.250 9.9.9.9 149.112.112.112 1.1.1.1"

systemctl enable firewalld
systemctl start firewalld
firewall-cmd --set-default-zone=work


########## qtile configuration install ############

sudo rm -rf ~/.config/qtile/
sudo rm -rf ~/.config/picom/

git clone https://github.com/TheCyberArcher/qtile-dotfiles.git ~/.qtile-dotfiles

sudo mv ~/.qtile-dotfiles/config.py ~/.config/qtile/
sudo mv ~/.qtile-dotfiles/picom.conf ~/.config/picom/
sudo mv ~/.qtile-dotfiles/autostart.sh ~/.config/qtile/

sudo mv ~/.qtile-dotfiles/assets/ ~/.config/qtile/

############ Virtualbox group ############

usermod -a -G vboxusers alerion

############ sddm activation ############

systemctl enable sddm.service

########## mirors update ##########

reflector --country France,Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist