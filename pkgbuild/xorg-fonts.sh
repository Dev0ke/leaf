#!/bin/bash
set -e

source /etc/leaf.conf

cd ${PKG_DIR}/xorg-fonts

for package in $(grep -v '^#' ../xorg-fonts.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.bz2}
  tar -xf $package
  pushd $packagedir
    ./configure $XORG_CONFIG
    make
    make install
  popd
  rm -rf $packagedir
done

echo "xorg-fonts" >> ${LOG_FILE}

exit 0
