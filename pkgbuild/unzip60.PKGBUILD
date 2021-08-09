#!/bin/bash

pkg_prepare() {
  patch -Np1 -i ${PKG_DIR}/unzip-6.0-consolidated_fixes-1.patch
}

pkg_compile() {
  make -f unix/Makefile generic
}

pkg_install() {
  make prefix=/usr MANDIR=/usr/share/man/man1 \
   -f unix/Makefile install
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
