#!/bin/bash
set -e

source /etc/leaf.conf

cd ${PKG_DIR}/xorg-apps

for package in $(grep -v '^#' ../xorg-apps.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.?z*}
  tar -xf $package
  pushd $packagedir
     case $packagedir in
       luit-[0-9]* )
         sed -i -e "/D_XOPEN/s/5/6/" configure
       ;;
     esac

     ./configure $XORG_CONFIG
     make
     make install
  popd
  rm -rf $packagedir
done

rm -f $XORG_PREFIX/bin/xkeystone

echo "xorg-apps" >> ${LOG_FILE}

exit 0
