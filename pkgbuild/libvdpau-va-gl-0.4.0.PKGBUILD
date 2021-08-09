#!/bin/bash

pkg_prepare() {
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$XORG_PREFIX ..
}

pkg_compile() {
  make
}

pkg_install() {
  make install
}

pkg_config() {
  echo "export VDPAU_DRIVER=va_gl" >> /etc/profile.d/xorg.sh
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
