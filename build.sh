#!/usr/bin/bash

# ALL HAIL TO FEDORA, FEDORA IS LOVE, FEDORA IS LIFE!
# Basado en http://paste.fedoraproject.org/433480/47463865/raw/

set -e

if [[ $EUID -ne 0 ]]; then
       echo "Mandale sudo papu!" 1>&2
      exit 1
fi

nombre_build="RocketGatitOS"
version_fedora="25"
fecha_build=$(date +%d%m%y)
ks_flat="${PWD}/rocketgatitos-ks/flat-${nombre_build}.ks"

#Flatteamos el ks, esto hace que se incluya todo en un solo archivo
ksflatten -v, --config "${PWD}"/rocketgatitos-ks/${nombre_build}.ks \
    -o "${ks_flat}" \
    --version ${version_fedora}

if test "$1" = "--sourceiso"; then
    echo "staring pungi runs"
    echo "start x86_64 Gather Stage"
    pungi -G  -c "${ks_flat}" --name "${nombre_build}" --ver "${version_fedora}" --force &&
    echo "create Repo"
    pungi -C -c "${ks_flat}" --name "${nombre_build}" --ver "${version_fedora}" --force &&
    echo "create Source.iso"
    pungi -I  -c "${ks_flat}" --name "${nombre_build}" --ver "${version_fedora}" --force --sourceisos &&
fi





mkdir -p "${PWD}"/live/

sudo livecd-creator \
    --config="${ks_flat}" \
    --fslabel="RocketGatitOS-${version_fedora}-${fecha_build}" \
    --cache="${PWD}"/live/ \
    --verbose
