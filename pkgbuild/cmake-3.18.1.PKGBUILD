#!/bin/bash

pkg_prepare() {
  sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake &&

  ./bootstrap --prefix=/usr        \
              --system-libs        \
              --mandir=/share/man  \
              --no-system-jsoncpp  \
              --no-system-librhash \
              --docdir=/share/doc/cmake-3.18.1
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
