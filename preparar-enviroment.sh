#!/usr/bin/bash

# Preparo el sistema, asegurate que estas conectadx a internet y que tu usuarix
# esta en sudoers ;) -- Happy  Hacking!!

# Necesarios para armar el entorno
paquetes_sistema=(lorax nosync pykickstart mock git rsync)

# Necesarios para hacer el build
paquetes_mock="pungi fedora-kickstarts lorax-lmc-novirt"

# Ruta de la configuracion de mock
mock_config="./fedora-25-x86_64.cfg"

# Ruta del chroot
ruta_chroot="/var/lib/mock/fedora-25-x86_64/"

# Verifica que los paquetes necesarios para la hacer el build esten instalados
verificar_paquetes()
{
    faltantes=()
    echo "Revisando si los paquetes necesarios estan instalados..."
    for p in ${paquetes_sistema[*]}
    do
        rpm -q "${p}" > /dev/null
        if [ $? -ne 0 ]; then
            #Los pquetes que flatan los agrego al array para luego instalarlos
            echo "[!] ${p}: falta"
            faltantes=("${faltantes[*]}" "${p}")
        fi
    done

    if [ ${#faltantes[*]} -ne 0 ]; then
        echo "Instalando los paquetes que faltan:"
        sudo dnf install ${faltantes[*]}
        status=$?

        #Si falló, aborto y salgo con el status del dnf
        if [ ${status} -ne 0 ]; then
            echo "Fallo la instalacion, abortando!"
            exit ${status}
        fi
    fi
    linea
}

# Creamos el ambiente de chroot
chrooting()
{
    echo "Verificando existencia del chroot"
    if [ -d "${ruta_chroot}" ];then
        echo "Posible chroot en ${ruta_chroot}, intentare usarlo"
        #instalamos los paquetes aca adentro
    else
        echo "Creando chroot con Mock"
        mock -r ${mock_config} --init
    fi

    mock_instalar_paquetes

    # creamos los directorios adentro del chroot
    mock -r ${mock_config} --shell "mkdir -p /result/ /usr/share/rocketgatitos-kickstart/"
    linea
}

# Le instalamos los paquetes necesarios
mock_instalar_paquetes()
{
    echo "Instalando paquetes dentro del chroot"
    mock -r ${mock_config} --install "${paquetes_mock}"
}


actualizar_submodulos()
{
    echo "Actualiando submodulos"
    git submodule init
    git submodule update
    linea
}

grupo_mock()
{
    usuario=$(whoami)
    echo "Agregamos a ${usuario} al grupo mock"
    sudo usermod -a -G mock "${usuario}"
    linea
}

desactivar_selinux()
{
    echo "Desactivando SElinux (No te olvides de volver a activarlo cuando termines de laburar)"
    sudo setenforce 0
    linea

}

crear_directorios()
{
    echo "Creando directorios"
    mkdir -p chroot resultado
    linea
}

linea()
{
    echo -e "\n--------------------------------------------------------------\n"
}




main()
{

    echo "Configurar entorno para buildear un remix de fedora"
    echo

    verificar_paquetes
    grupo_mock
    actualizar_submodulos
    desactivar_selinux
    crear_directorios
    chrooting


    echo "Happy Hacking!! :D "

}



main
