# cinnamon-look-and-feel.ks
#
# Descripcion:
# - Configuraciones para que cinnamon sea recontra re cool loco!
#
# Maintainer(s):
# - KaZe <Kaze@partidopirata.com.ar>



%post --nochroot --log=/root/ks-post-nochroot.log
# https://github.com/rhinstaller/pykickstart/blob/master/docs/kickstart-docs.rst#example

# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT
%end

%post --log=/root/ks-post.log
# Unos buenos ejemplos de como laburar con el dconf y cinnamon
# http://superuser.com/questions/1006983/how-to-set-cinnamon-preferences-in-command-line/1087459

# Seteamos Blue-submarine como tema
dconf write /org/cinnamon/theme/name 'Blue-Submarine'

# Seteamos Blue-submarine como controles
dconf write /org/cinnamon/desktop/interface/gtk-theme 'Blue-Submarine'

# Seteamos Blue-submarine como tema de ventana
dconf write /org/cinnamon/desktop/wm/preferences/theme 'Blue-Submarine'
# Iconos de gnome
dconf write /org/cinnamon/desktop/interface/icon-theme  'gnome'

%end


