#!/usr/bin/bash

# ALL HAIL TO FEDORA, FEDORA IS LOVE, FEDORA IS LIFE!

set -e

nombre_build="RocketGatitOS"
version_fedora="F24"
fecha_build=$(date +%d%m%y)

#Flatteamos el ks, esto hace que se incluya todo en un solo archivo
ksflatten -v, --config "${PWD}"/rocketgatitos-ks/${nombre_build}.ks \
    -o "${PWD}"/rocketgatitos-ks/flat-${nombre_build}.ks \
    --version ${version_fedora}

mkdir -p "${PWD}"/live/

sudo livecd-creator \
    --config="${PWD}"/rocketgatitos-ks/flat-${nombre_build}.ks \
    --fslabel=RocketGatitOS-${version_fedora}-${fecha_build} \
    --cache="${PWD}"/live/ \
    --verbose
