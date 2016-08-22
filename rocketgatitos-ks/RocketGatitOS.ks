# RocketGatitOS.ks
#
# Descripcion:
# - Remix de Fedora con aplicaciones para la comunicacion privada y segura
#
# Maintainer(s):
# - KaZe <Kaze@partidopirata.com.ar>

%include spin-kickstarts/fedora-live-cinnamon.ks
%include RocketGatitOS-packages.ks
%include duraskel.ks

# Incluimos los repos de rpmfusion-free, los non-free se agregan instalando el paquete
# RPMFusion
repo --name="RPMFusion Free" --baseurl=http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os/
repo --name="RPMFusion Free - Updates" --baseurl=http://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch/debug/

# Localizacion
lang es_AR.UTF-8
keyboard latam
timezone Argentina/Buenos_Aires

%post --nochroot --log=/root/ks-post-nochroot.log
# https://github.com/rhinstaller/pykickstart/blob/master/docs/kickstart-docs.rst#example

# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT

%end

%post --log=/root/ks-post.log

# Rebranding
sed -i -e ‘s/Generic release/Rocket GatitOS/g’ /etc/fedora-release /etc/issue

# Agrega los repos definidos en este .ks a la instalacion
$yum_config_stanza

%end


