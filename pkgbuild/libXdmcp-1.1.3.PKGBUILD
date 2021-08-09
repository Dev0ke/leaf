#!/bin/bash

pkg_prepare() {
  ./configure $XORG_CONFIG --docdir=/usr/share/doc/libXdmcp-1.1.3
}

pkg_compile() {
  make
}

pkg_install() {
  make install
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
