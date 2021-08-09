#!/bin/bash

pkg_prepare() {
  install  -v -m700 -d /var/lib/dhcpcd &&

  groupadd -g 52 dhcpcd        &&
  useradd  -c 'dhcpcd PrivSep' \
           -d /var/lib/dhcpcd  \
           -g dhcpcd           \
           -s /bin/false     \
           -u 52 dhcpcd &&
  chown    -v dhcpcd:dhcpcd /var/lib/dhcpcd

  ./configure --libexecdir=/lib/dhcpcd \
              --dbdir=/var/lib/dhcpcd  \
              --privsepuser=dhcpcd
}

pkg_compile() {
  make
}

pkg_install() {
  make install
}

pkg_config() {
  cd ${SYSTEMD_DIR}
  make install-dhcpcd
}

pkg_uninstall() {
  make uninstall
}

pkg_prepare
if [ "$1" == "install" ]; then
  pkg_compile
  pkg_install
  pkg_config
elif [ "$1" == "remove" ]; then
  pkg_uninstall
fi
