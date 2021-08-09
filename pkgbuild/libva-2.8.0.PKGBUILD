#!/bin/bash

pkg_prepare() {
  ./configure $XORG_CONFIG
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  
  tar -xvf ${PKG_DIR}/intel-vaapi-driver-2.4.1.tar.bz2 &&
  cd intel-vaapi-driver-2.4.1
  ./configure $XORG_CONFIG &&
  make
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
