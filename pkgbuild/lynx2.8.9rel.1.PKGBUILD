#!/bin/bash

pkg_prepare() {
  ./configure --prefix=/usr          \
              --sysconfdir=/etc/lynx \
              --datadir=/usr/share/doc/lynx-2.8.9rel.1 \
              --with-zlib            \
              --with-bzlib           \
              --with-ssl             \
              --with-screen=ncursesw \
              --enable-locale-charset
}

pkg_compile() {
  make
}

pkg_install() {
  make install-full &&
  chgrp -v -R root /usr/share/doc/lynx-2.8.9rel.1/lynx_doc
}

pkg_config() {
  sed -e '/#LOCALE/     a LOCALE_CHARSET:TRUE'     \
      -i /etc/lynx/lynx.cfg

  sed -e '/#DEFAULT_ED/ a DEFAULT_EDITOR:vim'      \
      -i /etc/lynx/lynx.cfg

  sed -e '/#PERSIST/    a PERSISTENT_COOKIES:TRUE' \
      -i /etc/lynx/lynx.cfg
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
