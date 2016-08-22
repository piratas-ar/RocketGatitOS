# nombre_del_archivo.ks
#
# Description:
# - Descripcion de lo que hace este .ks
#
# Maintainer(s):
# - nick <nick@dominio.com>



%post --nochroot --log=/root/ks-post-duraskel.log
# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT
    duraskel="../duraskel"

    chmod 700 ${duraskel}/src/.ssh ${duraskel}/src/.gnupg
    chmod 600 ${duraskel}/src/.ssh/authorized_keys ${duraskel}/src/.gnupg/*


	rsync -av ${duraskel}/src/ ${INSTALL_ROOT}/etc/skel/

%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

%end


