#!/bin/bash

pkg_prepare() {
  tar -xf ${PKG_DIR}/clang-10.0.1.src.tar.xz -C tools          &&
  tar -xf ${PKG_DIR}/compiler-rt-10.0.1.src.tar.xz -C projects &&

  mv tools/clang-10.0.1.src tools/clang &&
  mv projects/compiler-rt-10.0.1.src projects/compiler-rt

  mkdir build
  cd build

  CC=gcc CXX=g++                                  \
  cmake -DCMAKE_INSTALL_PREFIX=/usr               \
        -DLLVM_ENABLE_FFI=ON                      \
        -DCMAKE_BUILD_TYPE=Release                \
        -DLLVM_BUILD_LLVM_DYLIB=ON                \
        -DLLVM_LINK_LLVM_DYLIB=ON                 \
        -DLLVM_ENABLE_RTTI=ON                     \
        -DLLVM_TARGETS_TO_BUILD="host;AMDGPU;BPF" \
        -DLLVM_BUILD_TESTS=ON                     \
        -Wno-dev -G Ninja ..
}

pkg_compile() {
  ninja -j2
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
