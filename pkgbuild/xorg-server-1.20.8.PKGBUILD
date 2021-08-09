#!/bin/bash

pkg_prepare() {
  sed -i 's/malloc(pScreen/calloc(1, pScreen/' dix/pixmap.c
  ./configure $XORG_CONFIG            \
              --enable-glamor         \
              --enable-suid-wrapper   \
              --with-xkb-output=/var/lib/xkb
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  mkdir -pv /etc/X11/xorg.conf.d
}

pkg_config() {
  return
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
