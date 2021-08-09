#!/bin/bash

pkg_prepare() {
  sed '20,$ d' -i trust/trust-extract-compat.in &&
  cat >> trust/trust-extract-compat.in << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Generate a new trust store
/usr/sbin/make-ca -f -g
EOF

  ./configure --prefix=/usr     \
              --sysconfdir=/etc \
              --with-trust-paths=/etc/pki/anchors
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
          /usr/bin/update-ca-certificates
}

pkg_config() {
  ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
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
