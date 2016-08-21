# RocketGatitOS.ks
#
# Descripcion:
# - Remix de Fedora con aplicaciones para la comunicacion privada y segura
#
# Maintainer(s):
# - KaZe <Kaze@partidopirata.com.ar>

%include spin-kickstarts/fedora-live-base.ks
%include spin-kickstarts/fedora-live-minimization.ks
%include RocketGatitOS-packages.ks
# Incluimos los repos de rpmfusion-free, los non-free se agregan instalando el paquete
# RPMFusion
repo --name="RPMFusion Free" --baseurl=http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os/
repo --name="RPMFusion Free - Updates" --baseurl=http://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch/debug/
repo --name="RPMFusion Non-Free" --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/$releasever/Everything/$basearch/os/
repo --name="RPMFusion Non-Free - Updates" --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/$releasever/$basearch/debug/

# Localizacion
lang es_AR.UTF-8
keyboard latam
timezone Argentina/Buenos_Aires

part / --size=6144

%post --nochroot --log=/root/ks-post-nochroot.log
# https://github.com/rhinstaller/pykickstart/blob/master/docs/kickstart-docs.rst#example

# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT

%end

%post --log=/root/ks-post.log
#  https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html/Installation_Guide/s1-kickstart2-postinstallconfig.html
# cinnamon configuration

# create /etc/sysconfig/desktop (needed for installation)

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/cinnamon-session
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

# set up lightdm autologin
sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# set Cinnamon as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=cinnamon/' /etc/lightdm/lightdm.conf

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop
cp /usr/share/applications/liveinst.desktop /home/liveuser/Desktop

# and mark it as executable
chmod +x /home/liveuser/Desktop/liveinst.desktop

# this goes at the end after all other changes.
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

EOF

# Rebranding
sed -i -e ‘s/Generic release/Rocket GatitOS/g’ /etc/fedora-release /etc/issue

# Agrega los repos definidos en este .ks a la instalacion
$yum_config_stanza

%end


