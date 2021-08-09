#!/bin/bash

pkg_prepare() {
  patch -Np1 -i ${PKG_DIR}/curl-7.71.1-security_fixes-1.patch
  ./configure --prefix=/usr                           \
              --disable-static                        \
              --enable-threaded-resolver              \
              --with-ca-path=/etc/ssl/certs
}

pkg_compile() {
  make
}

pkg_install() {
  make install

  rm -rf docs/examples/.deps &&

  find docs \( -name Makefile\* -o -name \*.1 -o -name \*.3 \) -exec rm {} \; &&

  install -v -d -m755 /usr/share/doc/curl-7.71.1 &&
  cp -v -R docs/*     /usr/share/doc/curl-7.71.1
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
