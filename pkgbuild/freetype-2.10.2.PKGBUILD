#!/bin/bash

pkg_prepare() {
  tar -xf ${PKG_DIR}/freetype-doc-2.10.2.tar.xz --strip-components=2 -C docs
  sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&

  sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
      -i include/freetype/config/ftoption.h  &&

  ./configure --prefix=/usr --enable-freetype-config --disable-static
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  install -v -m755 -d /usr/share/doc/freetype-2.10.2 &&
  cp -v -R docs/*     /usr/share/doc/freetype-2.10.2 &&
  rm -v /usr/share/doc/freetype-2.10.2/freetype-config.1
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
