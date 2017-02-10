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
firefox
mumble
owncloud-client
pidgin
pidgin-otr
ring
thunderbird
tor
torbrowser-launcher
transmission
youtube-dl

# Utilidades
gparted
p7zip
pinentry-gtk
seahorse
unar
unetbootin
vlc

# Privacidad
bleachbit
#cryptkeeper
encfs
gnupg2
keepassx

# Seguridad
#aide
rkhunter
usbguard
usbguard-applet-qt
# Diseno
gimp
inkscape

# Miscelaneo
hack-fonts

# make sure we have a graphical installer
yumex-dnf

# save some space
-fedora-icon-theme

# Rebranding
-fedora-logos
-fedora-release
-fedora-release-notes

generic-logos
generic-release
generic-release-notes
%end
