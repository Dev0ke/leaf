#!/bin/bash

pkg_prepare() {
  ./configure --prefix=/usr --disable-static
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  make -C doc/reference install-data-local
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
