#!/usr/bin/bash

# ALL HAIL TO FEDORA, FEDORA IS LOVE, FEDORA IS LIFE!

nombre_build="RocketGatitOS"
version_fedora="F24"
fecha_build=$(date +%d%m%y)

#Flatteamos el ks, esto hace que se incluya todo en un solo archivo
ksflatten -v, --config "${PWD}"/spin-kickstarts/${nombre_build}.ks \
    -o "${PWD}"/spin-kickstarts/flat-${nombre_build}.ks \
    --version ${version_fedora}

sudo livecd-creator \
    --config="${PWD}"/spin-kickstarts/flat-${nombre_build}.ks \
    --fslabel=RocketGatitOS-${version_fedora}-${fecha_build} \
    --cache=/var/cache/live \
    --verbose
