#!/bin/bash

pkg_prepare() {
  gzip -cd ${PKG_DIR}/libpng-1.6.37-apng.patch.gz | patch -p1
  ./configure --prefix=/usr --disable-static
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  mkdir -v /usr/share/doc/libpng-1.6.37 &&
  cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.37
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
