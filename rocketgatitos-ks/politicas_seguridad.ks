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
%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

#chrony: Seteamos los servers de ntp
#REF:  AU-8(1), 160
cat  >>/etc/chrony <<'EOF'
server 0.ar.pool.ntp.org iburst
server 1.south-america.pool.ntp.org
server 2.south-america.pool.ntp.org
EOF

#No permitir logins directos como root
#REF: IA-2(1)
echo > /etc/securetty

#Drop a todo lo entrante en firewalld
#REF:CM-7, 66, 1109, 1154, 1414

cat  >>/etc/firewalld/firewalld.conf <<'EOF'


#Dropeamos todo lo que no cumpla con nustras reglas
DefaultZone=drop
EOF
%end


