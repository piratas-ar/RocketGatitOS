# duraskel.ks
#
# Description:
# - Copia las configs de duraskel
#
# Maintainer(s):
# - kaze <kaze@partidopirata.com.ar>



%post --nochroot --log=/root/ks-post-firefox.log
# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT
    chmod 700 duraskel/src/.ssh duraskel/src/.gnupg
    chmod 600 -R duraskel/src/.ssh/authorized_keys duraskel/src/.gnupg

	rsync -av duraskel/src/ ${INSTALL_ROOT}/etc/skel/

%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

%end


