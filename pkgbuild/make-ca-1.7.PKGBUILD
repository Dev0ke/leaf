#!/bin/bash

pkg_prepare() {
  return
}

pkg_compile() {
  return
}

pkg_install() {
  make install
  install -vdm755 /etc/ssl/local
  /usr/sbin/make-ca -g
  systemctl enable update-pki.timer
}

pkg_config() {
  wget http://www.cacert.org/certs/root.crt &&
  wget http://www.cacert.org/certs/class3.crt &&
  openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
          -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
          > /etc/ssl/local/CAcert_Class_1_root.pem &&
  openssl x509 -in class3.crt -text -fingerprint -setalias "CAcert Class 3 root" \
          -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
          > /etc/ssl/local/CAcert_Class_3_root.pem &&
  /usr/sbin/make-ca -r -f
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
