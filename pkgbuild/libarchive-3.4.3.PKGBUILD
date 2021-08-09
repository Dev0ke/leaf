#!/bin/bash

pkg_prepare() {
  patch -Np1 -i ${PKG_DIR}/libarchive-3.4.3-testsuite_fix-1.patch
  ./configure --prefix=/usr --disable-static
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