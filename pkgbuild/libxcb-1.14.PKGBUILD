#!/bin/bash

pkg_prepare() {
  CFLAGS=-Wno-error=format-extra-args ./configure $XORG_CONFIG      \
              --without-doxygen \
              --docdir='${datadir}'/doc/libxcb-1.14
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
