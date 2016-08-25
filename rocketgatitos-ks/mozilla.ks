# mozilla.ks
#
# Description:
# - Instala los addons de mozilla
# - Toca algunas configuraciones
#
# Maintainer(s):
# - kaze <kaze@partidopirata.com.ar>



%post --nochroot --log=/root/ks-post-firefox.log
# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT

# plugins para firefox
#  HTTPS everywhere
#  Perspective
#  µBlock
#  Flash Video Downloader
#  Privacy Badger
morcilla=(
  https://www.eff.org/files/https-everywhere-latest.xpi
  https://addons.mozilla.org/firefox/downloads/latest/7974/addon-7974-latest.xpi
  https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
  https://addons.mozilla.org/firefox/downloads/latest/6584/platform:2/addon-6584-latest.xpi
  https://addons.mozilla.org/firefox/downloads/latest/4578/addon-4578-latest.xpi
  https://addons.mozilla.org/firefox/downloads/latest/519896/platform:3/addon-519896-latest.xpi
)

# plugins para thunderbird
# paranoia - https://addons.mozilla.org/en-US/thunderbird/addon/paranoia/
# display quota - https://addons.mozilla.org/en-US/thunderbird/addon/display-quota/
# lovebird - https://addons.mozilla.org/en-US/thunderbird/addon/lovebird/
# MinimizeToTray Revived - https://addons.mozilla.org/es/thunderbird/addon/minimizetotray-revived/
morcilla_tb=(
  http://gdr.geekhood.net/gdrwpl/heavy/paranoia.xpi
  https://addons.mozilla.org/thunderbird/downloads/latest/881/addon-881-latest.xpi
  https://addons.mozilla.org/thunderbird/downloads/file/194876/lovebird-1.0b1-tb.xpi
  https://addons.mozilla.org/thunderbird/downloads/latest/minimizetotray-revived/platform:2/addon-12581-latest.xpi
)

# Retrieve the extension id for an addon from its install.rdf
# http://kb.mozillazine.org/Determine_extension_ID
get_extension_id() {
  unzip -qc $1 install.rdf | xmlstarlet sel \
        -N rdf=http://www.w3.org/1999/02/22-rdf-syntax-ns# \
        -N em=http://www.mozilla.org/2004/em-rdf# \
        -t -v \
        "//rdf:Description[@about='urn:mozilla:install-manifest']/em:id" ||
        echo
}

function download_morcilla_addons() {
  pushd "${INSTALL_ROOT}"/usr/lib64/thunderbird/extensions/
  wget -c "${morcilla_tb[@]}"
  popd

  pushd "${INSTALL_ROOT}"/usr/lib64/firefox/browser/extensions/
  wget -c "${morcilla[@]}"
  popd
}

function install_morcilla_addons() {
  for i in "${INSTALL_ROOT}"/usr/lib64/{thunderbird,firefox/browser}/extensions/*.xpi; do
    id="$(get_extension_id "$i")"

    test -z "$id" && continue
    mkdir "${i%/*}/$id" || continue
    pushd "${i%/*}/$id"
    unzip "$i"
    popd
  done

  find "${INSTALL_ROOT}"/usr/lib64/thunderbird/extensions/ \
      "${INSTALL_ROOT}"/usr/lib64/firefox/browser/extensions/ \
      -type d -exec chmod 755 {} \;

  find "${INSTALL_ROOT}"/usr/lib64/thunderbird/extensions/ \
      "${INSTALL_ROOT}"/usr/lib64/firefox/browser/extensions/ \
      -type f -exec chmod 644 {} \;
}

download_morcilla_addons

install_morcilla_addons

%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

%end


