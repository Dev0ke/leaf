#!/bin/bash

pkg_prepare() {
  mkdir build &&
  cd build &&
  meson --prefix=$XORG_PREFIX -Dlegacy=true ..
}

pkg_compile() {
  ninja
}

pkg_install() {
  ninja install &&

  install -vdm 755 $XORG_PREFIX/share/doc/xorgproto-2020.1 &&
  install -vm 644 ../[^m]*.txt ../PM_spec $XORG_PREFIX/share/doc/xorgproto-2020.1
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
