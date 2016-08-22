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


# Internet
transmission
pidgin
pidgin-otr
hexchat
firefox
thunderbird
torbrowser-launcher
mumble
youtube-dl
tor
owncloud-client

# Utilidades
gparted
brasero
unetbootin
seahorse
p7zip
unar
vlc

# Privacidad
encfs
cryptkeeper
bleachbit
keepassx

# Seguridad
aide
rkhunter

# Diseno
gimp
inkscape


# make sure we have a graphical installer
yumex-dnf

# save some space
-fedora-icon-theme
-PackageKit*                # we switched to yumex, so we don't need this

# Rebranding
-fedora-release
-fedora-logos
-fedora-release-notes

generic-release
generic-logos
generic-release-notes
%end
