#!/bin/bash

pkg_prepare() {
  mkdir build
  cd build

  meson --prefix=$XORG_PREFIX ..
}

pkg_compile() {
  ninja
}

pkg_install() {
  ninja install
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
