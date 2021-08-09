#!/bin/bash

pkg_prepare() {
  ./configure --prefix=/usr \
              --with-gitconfig=/etc/gitconfig \
              --with-python=python3
}

pkg_compile() {
  make
}

pkg_install() {
  make perllibdir=/usr/lib/perl5/5.32/site_perl install
  
  tar -xf ${PKG_DIR}/git-manpages-2.28.0.tar.xz \
      -C /usr/share/man --no-same-owner --no-overwrite-dir
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
