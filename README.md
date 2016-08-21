RocketGatitOS
============

Repos agregados:
-------------
* rpmfusion-free
* rpmfusion-nonfree (solo para unrar)


¿Cómo clono este repo?
----------------------
* `git clone https://github.com/piratas-ar/RocketGatitOS.git`
* `git submodule init`
* `git submodule update`


Descripción de ficheros y directorios:
-----------------

Nombre | Descripción
-------|-----------
rocketgatitos-ks | Directorio con nuestros propios archivos kickstart
spin-kickstarts | Directorio con los .ks oficiales de Fedora (submodulo git)
preparar-enviroment.sh | Verifica que los paquetes necesarios esten instalados, si no estan, los instala.
build.sh | Hace el flat de los .ks y ejecuta el livecreator-tool para armar la iso
TODO.txt | Lo que nos falta hacer


¿Cómo construyo mi iso?
-----------------
* `./preparar-enviroment.sh`

Aca pasa lo interesante, primero se ejecuta ksflatter que procesa los .ks
y genera un solo archivo con todo incluido.
Luego el __livecreator-tool__ va a descargar todos los paquetes necesarios para
instalarla dentro del sistema que estamos generando. Hay que tener en cuenta que
los paquetes se descargaran en __directorio-actual/live__, así que asegurate de tener
suficiente capacidad.
Si tenes intencion de seguir laburando conviene que no borres ese directorio, asi la proxima vez no vas a tener que descargar todos los paquetes de nuevo.

La iso se genera en el directorio donde se ejecuta el script.
