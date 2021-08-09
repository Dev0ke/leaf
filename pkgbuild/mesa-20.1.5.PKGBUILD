#!/bin/bash

pkg_prepare() {
  patch -Np1 -i ${PKG_DIR}/mesa-20.1.5-add_xdemos-1.patch
  sed '1s/python/&3/' -i bin/symbols-check.py
  GALLIUM_DRV="i915,iris,nouveau,r600,radeonsi,svga,swrast,virgl"
  DRI_DRIVERS="i965,nouveau"

  mkdir build
  cd build
  meson --prefix=$XORG_PREFIX          \
        -Dbuildtype=release            \
        -Ddri-drivers=$DRI_DRIVERS     \
        -Dgallium-drivers=$GALLIUM_DRV \
        -Dgallium-nine=false           \
        -Dglx=dri                      \
        -Dosmesa=gallium               \
        -Dvalgrind=false               \
        -Dlibunwind=false              \
        ..
  unset GALLIUM_DRV DRI_DRIVERS
}

pkg_compile() {
  ninja
}

pkg_install() {
  ninja install
  install -v -dm755 /usr/share/doc/mesa-20.1.5 &&
  cp -rfv ../docs/* /usr/share/doc/mesa-20.1.5
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
