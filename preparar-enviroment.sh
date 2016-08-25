#!/usr/bin/bash

#Preparo el sistema, asegurate que estas conectadx a internet y que tu usuarix
#esta en sudoers ;) -- Happy  Hacking!!

#Paquetes necesarios para hacer el build
paquetes=(livecd-tools system-config-kickstart git rsync xmlstarlet)



#Verifica que los paquetes necesarios para la hacer el build esten instalados
verificar_paquetes()
{
    faltantes=()
    echo "Revisando si los paquetes necesarios estan instalados"
    for p in ${paquetes[*]}
    do
        rpm -q "${p}" > /dev/null
        if [ $? -ne 0 ]; then
            #Los pquetes que flatan los agrego al array para luego instalarlos
            echo "${p}"": Falta"
            faltantes=("${faltantes[*]}" ${p})
        fi
    done

    if [ ${#faltantes[*]} -ne 0 ]; then
        echo "Instalando los paquetes que faltan:"
        sudo dnf install "${faltantes[*]}"
        status=$?

        #Si falló aborto y salgo con el status del dnf
        if [ ${status} -ne 0 ]; then
            echo "Fallo la instalacion, abortando!"
            exit ${status}
        fi
    fi
}

actualizar_submodulos()
{
    git submodule init
    git submodule update
}

main()
{
    echo "Configurar entorno para buildear un remix de fedora"
    verificar_paquetes
    actualizar_submodulos

    echo "Desactivando SElinux (No te olvides de volver a activarlo cuando termines de laburar)"
    sudo setenforce 0

    echo "Happy Hacking!! :D "

}



main
