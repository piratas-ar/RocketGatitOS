RocketGatitOS
============

Descripcion de ficheros y directorios:
-----------------

Nombre | Descripcion
-------|-----------
rocketgatitos-ks | Directorio con nuestros propios archivos kickstart
preparar-enviroment.sh | Verifica que los paquetes necesarios esten instalados,
si no estan, los instala.
build.sh | Hace el flat de los .ks y ejecuta el livecreator-tool para armar la
iso
spin-kickstarts | Directorio con los .ks oficiales de Fedora
TODO.txt | Lo que nos falta hacer


¿Como armo mi iso?
-----------------
* `./preparar-enviroment.sh`

Aca pasa lo interesante, primero se ejecuta ksflatter que procesa los .ks
y genera un solo archivo con todo incluido.
Luego el __livecreator-tool__ va a descargar todos los paquetes necesarios para
instalarla dentro del sistema que estamos generando. Hay que tener en cuenta que
los paquetes se descargaran en /var/cache/live, así que asegurate de tener
suficiente capacidad.

La iso se genera en el directorio donde se ejecuta el script.
