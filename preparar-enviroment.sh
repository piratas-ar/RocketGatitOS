#!/usr/bin/bash

#Preparo el sistema, asegurate que estas conectadx a internet y que tu usuarix
#esta en sudoers ;) -- Happy  Hacking!!

#Paquetes necesarios para hacer el build
paquetes=(livecd-tools l10n-kickstarts system-config-kickstart fedora-kickstarts)



#Verifica que los paquetes necesarios para la hacer el build esten instalados
verificar_paquetes()
{
    faltantes=()
    echo "Revisando si los paquetes necesarios estan instalados"
    for p in "${paquetes[*]}"
    do
        rpm -q $p > /dev/null
        if [ $? -ne 0 ]; then
            #Los pquetes que flatan los agrego al array para luego instalarlos
            echo ${p}": Falta"
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

crear_directorios()
{
    mkdir -p "${PWD}"/spin-kickstarts
    cp /usr/share/spin-kickstarts/*.ks "${PWD}"/spin-kickstarts/
}

main()
{
    echo "Configurar entorno para buildear un remix de fedora"
    verificar_paquetes
    crear_directorios

    echo "Es necesario tener desactivado selinux"
    sudo setenforce 0

    echo "Happy Hacking!! :D "

}



main
