#!/bin/bash

pkg_prepare() {
  return
}

pkg_compile() {
  python3 setup.py build
}

pkg_install() {
  python3 setup.py install --optimize=1
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
