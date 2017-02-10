RocketGatitOS
============

RocketGatitOS, es una distribucion de gnu/linux basada en Fedora, la creamos con
la finalidad de brindar un sistema operativo que cuente desde la instalacion con
herramientas seguras para la comunicacion diaria, tambien incluimos add-ons para
el navegador y aplicaciones de uso general.

Si ya tenes Fedora instalada podes fijarte los paquetes que usamos e instalarlos
en tu maquina. Tambien modificamos algunas configuraciones.

Repos agregados:
-------------
* rpmfusion-free
* Ring (copr)
* USBGUARD (copr)
* Heliocastro Hack Fonts (copr)


¿Cómo clono este repo?
----------------------
1. `git clone https://github.com/piratas-ar/RocketGatitOS.git`
1. `cd RocketGatitOS`
1. `git submodule init`
1. `git submodule update`


Descripción de ficheros y directorios:
-----------------

Nombre | Descripción
-------|-----------
rocketgatitos-ks | Directorio con nuestros propios archivos kickstart
spin-kickstarts | Directorio con algunos .ks oficiales de Fedora.
preparar-enviroment.sh | Verifica que los paquetes necesarios esten instalados, si no estan, los instala.
build.sh | Hace el flat de los .ks y ejecuta el livecreator-tool para armar la iso
TODO.txt | Lo que nos falta hacer


¿Cómo construyo mi iso?
-----------------
Vas a necesitar estar conectadx a internet.

1. `./preparar-enviroment.sh`
1. `./build.sh`

He aquí la mismisima magia, el segundo script lo que hace es crear un ambiente
(chroot) para armar la iso.
Este chroot se crea por defecto en `/var/lib/mock/`, si queres que se cree en
otra ubicaciones tenes que editar `fedora-25-x86_64.cfg` que esta en la carpeta
base del proyecto y editar la linea
`
config_opts['basedir'] =  '/ruta/completa/al/chroot/'
`
¿Cómo pruebo la imagen?
-----------------------

Si solo te interesa probar el live lo que podes hacer es
`qemu-kvm -m 1024 -vga qxl -cdrom RocketGatitOS*.iso`

Para instalar podes usar virt-manager, caja u otro administrador de maquinas virtuales.


¿Che y no necesitan diseños?
------------------------

¡Más vale! date una vuelta por [ACA!!!](https://github.com/piratas-ar/RocketGatitos-sexyness)
