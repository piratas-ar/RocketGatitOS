# nombre_del_archivo.ks
#
# Description:
# - Descripcion de lo que hace este .ks
#
# Maintainer(s):
# - nick <nick@dominio.com>

# Directivas:
# https://github.com/rhinstaller/pykickstart/blob/master/docs/kickstart-docs.rst



%post --nochroot --log=/root/ks-post-nochroot.log
# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT

%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

%end


