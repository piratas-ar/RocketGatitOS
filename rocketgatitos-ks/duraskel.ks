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

	rsync -av --exclude 'duraskel/src/.bashrc' duraskel/src/ ${INSTALL_ROOT}/etc/skel/

    # Agregamos el uamsk, por que la config de fedora esta buena
    echo "umask 027" >> ${INSTALL_ROOT}/etc/skel/.bashrc
    cat << EOF >> ${INSTALL_ROOT}/etc/skel/.bashrc
		man() {
			env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
			LESS_TERMCAP_md=$(printf "\e[1;31m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
		}
    EOF


%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

%end


