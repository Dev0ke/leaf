#!/bin/bash

pkg_prepare() {
  sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap
  printf '\tkbs=\\177,\n' >> terminfo

  TERMINFO=/usr/share/terminfo \
  ./configure $XORG_CONFIG     \
      --with-app-defaults=/etc/X11/app-defaults
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  make install-ti &&

  mkdir -pv /usr/share/applications &&
  cp -v *.desktop /usr/share/applications/
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
