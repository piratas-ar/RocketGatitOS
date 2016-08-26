# RocketGatitOS-packages.ks
#
# Description:
# - Paquetes para RocketGatitOS :D
#
# Maintainer(s):
# - Kaze <kaze@partidopirata.com.ar>

%packages

@networkmanager-submodules
@cinnamon-desktop
@libreoffice
libreoffice-langpack-es

xorg-x11-drv-evdev

#Networking
NetworkManager-openvpn-gnome
openvpn

# Internet
transmission
pidgin
pidgin-otr
firefox
thunderbird
torbrowser-launcher
mumble
youtube-dl
tor
owncloud-client

# Utilidades
pinentry-gtk
unetbootin
seahorse
gparted
p7zip
unar
vlc

# Privacidad
encfs
cryptkeeper
bleachbit
keepassx

# Seguridad
#aide
rkhunter

# Diseno
gimp
inkscape

# Miscelaneo

# make sure we have a graphical installer
yumex-dnf

# save some space
-fedora-icon-theme

# Rebranding
-fedora-release
-fedora-logos
-fedora-release-notes

generic-release
generic-logos
generic-release-notes
%end
