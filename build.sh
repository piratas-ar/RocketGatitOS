#!/usr/bin/bash

# ALL HAIL TO FEDORA, FEDORA IS LOVE, FEDORA IS LIFE!
# Basado en http://paste.fedoraproject.org/433480/47463865/raw/

set -e

mock_config="./fedora-25-x86_64.cfg"

nombre_build="RocketGatitOS"
version_fedora="25"
fecha_build=$(date +%d%m%y)
ks_flat="${PWD}/rocketgatitos-ks/flat-${nombre_build}.ks"


#Flatteamos el ks, esto hace que se incluya todo en un solo archivo
echo "--KSFLATTEN--"
ksflatten --config "${PWD}"/rocketgatitos-ks/${nombre_build}.ks \
    --output "${ks_flat}" \
    --version "F${version_fedora}"

# Limpiamos de posibles viejas versiones
echo "--LIMPIANDO POSIBLES VIEJAS VERSIONES--"
mock -r ${mock_config} --shell "rm -rf /result/*"-
mock -r ${mock_config} --shell "rm -rf /root/result/*"-

# Copiamos el ks dentro del build
echo "--COPIANDO DENTRO DEL MOCK--"
mock -r ${mock_config} --copyin  "${ks_flat}" /result/
mock -r ${mock_config} --copyin  "duraskel" /result/ &&

# Entramos al chroot
echo "--BUILDING--"
mock -r ${mock_config} --shell <<EOF
cd /result/

livemedia-creator --ks "flat-${nombre_build}.ks" \
                  --no-virt  \
                  --resultdir=/results/${fecha_build} \
                  --logfile=/results/logs/${fecha_build}.log \
                  --project "${nombre_build}" --make-iso \
                  --volid "${nombre_build}-${version_fedora}" --iso-only \
                  --iso-name "${nombre_build}-${version_fedora}-x86_64.iso" \
                  --releasever "${version_fedora}" \
                  --title "${nombre_build}-live" --macboot

EOF

#livemedia-creator --ks "/usr/share/rocketgatitos-kickstart/flat-${nombre_build}.ks" \
                  #--no-virt --resultdir /results/ \
                  #--project "${nombre_build}" --make-iso \
                  #--volid "${nombre_build}-${version_fedora}" --iso-only \
                  #--iso-name "${nombre_build}-${version_fedora}-x86_64.iso" \
                  #--releasever "${version_fedora}" \
                  #--title "${nombre_build}-live" --macboot
#pungi --nosource --nodebuginfo \
      #--flavor "${nombre_build}" --name "${nombre_build}" \
      #--ver "${version_fedora}"\
      #-c "/usr/share/rocketgatitos-kickstart/flat-${nombre_build}.ks"


#if test "$1" = "--sourceiso"; then
    #echo "staring pungi runs"
    #echo "start x86_64 Gather Stage"
    #pungi -G  -c "${ks_flat}" --name "${nombre_build}" --ver "${version_fedora}" --force &&
    #echo "create Repo"
    #pungi -C -c "${ks_flat}" --name "${nombre_build}" --ver "${version_fedora}" --force &&
    #echo "create Source.iso"
    #pungi -I  -c "${ks_flat}" --name "${nombre_build}" --ver "${version_fedora}" --force --sourceisos &&
#fi





#mkdir -p "${PWD}"/live/

#sudo livecd-creator \
    #--config="${ks_flat}" \
    #--fslabel="RocketGatitOS-${version_fedora}-${fecha_build}" \
    #--cache="${PWD}"/live/ \
    #--verbose
