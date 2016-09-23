# repositorios.ks
#
# Description:
# - Instala los repositorios
#
# Maintainer(s):
# - kaze <kaze@partidopirata.com.ar>



%post --nochroot --log=/root/ks-post-repositorios.log
# Esto es fuera del chroot, asi que sirve para copiar archivos dentro de la instalacion.
# Como usamos el livecd-creator la ruta de la instalacion es $INSTALL_ROOT

%end


%post --log=/root/ks-post.log
# Se ejecutara dentro del entorno chroot

#Importamos la llave gpg
rpmkeys --import "http://rpmfusion.org/keys?action=AttachFile&do=get&target=RPM-GPG-KEY-rpmfusion-free-fedora-24"

cat >/etc/yum.repos.d/rpmfusion-free.repo <<EOF
[rpmfusion-free-rawhide]
name=RPM Fusion for Fedora Rawhide - Free
#baseurl=http://download1.rpmfusion.org/free/fedora/development/$basearch/os/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-rawhide&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-latest file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-rawhide

[rpmfusion-free-rawhide-debuginfo]
name=RPM Fusion for Fedora Rawhide - Free - Debug
#baseurl=http://download1.rpmfusion.org/free/fedora/development/$basearch/os/debug/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-rawhide-debug&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-latest file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-rawhide

[rpmfusion-free-rawhide-source]
name=RPM Fusion for Fedora Rawhide - Free - Source
#baseurl=http://download1.rpmfusion.org/free/fedora/development/source/SRPMS/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-rawhide-source&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-latest file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-rawhide

[rpmfusion-free]
name=RPM Fusion for Fedora $releasever - Free
#baseurl=http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
enabled=1
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-debuginfo]
name=RPM Fusion for Fedora $releasever - Free - Debug
#baseurl=http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/debug/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-debug-$releasever&arch=$basearch
enabled=0
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-source]
name=RPM Fusion for Fedora $releasever - Free - Source
#baseurl=http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/source/SRPMS/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-source-$releasever&arch=$basearch
enabled=0
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-updates]
name=RPM Fusion for Fedora $releasever - Free - Updates
#baseurl=http://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-updates-debuginfo]
name=RPM Fusion for Fedora $releasever - Free - Updates Debug
#baseurl=http://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch/debug/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-debug-$releasever&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-updates-source]
name=RPM Fusion for Fedora $releasever - Free - Updates Source
#baseurl=http://download1.rpmfusion.org/free/fedora/updates/$releasever/SRPMS/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-source-$releasever&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-updates-testing]
name=RPM Fusion for Fedora $releasever - Free - Test Updates
#baseurl=http://download1.rpmfusion.org/free/fedora/updates/testing/$releasever/$basearch/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-$releasever&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-updates-testing-debuginfo]
name=RPM Fusion for Fedora $releasever - Free - Test Updates Debug
#baseurl=http://download1.rpmfusion.org/free/fedora/updates/testing/$releasever/$basearch/debug/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-debug-$releasever&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

[rpmfusion-free-updates-testing-source]
name=RPM Fusion for Fedora $releasever - Free - Test Updates Source
#baseurl=http://download1.rpmfusion.org/free/fedora/updates/testing/$releasever/SRPMS/
mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-source-$releasever&arch=$basearch
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever

EOF

cat >/etc/yum.repos.d/ring.repo <<EOF
[ring]
name=Ring $releasever - $basearch - ring
baseurl=https://dl.ring.cx/ring-nightly/fedora_$releasever
gpgcheck=1
gpgkey=https://dl.ring.cx/ring.pub.key
enabled=1
EOF

# === COPR ===

# USBGUARD
cat >/etc/yum.repos.d/_copr_mildew-usbguard.repo <<EOF
[mildew-usbguard]
name=Copr repo for usbguard owned by mildew
baseurl=https://copr-be.cloud.fedoraproject.org/results/mildew/usbguard/fedora-$releasever-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/mildew/usbguard/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
EOF
%end


