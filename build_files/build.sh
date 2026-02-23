#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y openssh
dnf5 install -y podman
dnf5 install -y niri
dnf5 install -y nvim
dnf5 install -y ncdu
dnf5 install -y firefox
dnf5 install -y virt-manager
dnf5 install -y greetd

# COPR install
dnf5 -y copr enable avengemedia/dms
dnf5 -y install dms
dnf5 -y install dms-greeter
dnf5 -y copr disable avengemedia/dms

systemctl enable greetd


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket

