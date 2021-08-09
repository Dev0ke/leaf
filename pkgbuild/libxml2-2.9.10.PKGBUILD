#!/bin/bash

pkg_prepare() {
  sed -i 's/test.test/#&/' python/tests/tstLastError.py
  ./configure --prefix=/usr    \
              --disable-static \
              --with-history   \
              --with-python=/usr/bin/python3
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