#!/bin/bash

pkg_prepare() {
  sed -i 's/GROUP="render", //' rules.d/50-udev-default.rules.in
  mkdir build
  cd  build

  meson --prefix=/usr                 \
        --sysconfdir=/etc             \
        --localstatedir=/var          \
        -Dblkid=true                  \
        -Dbuildtype=release           \
        -Ddefault-dnssec=no           \
        -Dfirstboot=false             \
        -Dinstall-tests=false         \
        -Dldconfig=false              \
        -Dman=auto                    \
        -Drootprefix=                 \
        -Drootlibdir=/lib             \
        -Dsplit-usr=true              \
        -Dsysusers=false              \
        -Drpmmacrosdir=no             \
        -Db_lto=false                 \
        -Dhomed=false                 \
        -Duserdb=false                \
        -Ddocdir=/usr/share/doc/systemd-246 \
        ..
}

pkg_compile() {
  ninja
}

pkg_install() {
  ninja install
}

pkg_config() {
  cat >> /etc/pam.d/system-session << "EOF"
# Begin Systemd addition
    
session  required    pam_loginuid.so
session  optional    pam_systemd.so

# End Systemd addition
EOF

  cat > /etc/pam.d/systemd-user << "EOF"
# Begin /etc/pam.d/systemd-user

account  required    pam_access.so
account  include     system-account

session  required    pam_env.so
session  required    pam_limits.so
session  required    pam_unix.so
session  required    pam_loginuid.so
session  optional    pam_keyinit.so force revoke
session  optional    pam_systemd.so

auth     required    pam_deny.so
password required    pam_deny.so

# End /etc/pam.d/systemd-user
EOF
}

pkg_uninstall() {
  return
}

pkg_prepare
if [ "$1" == "install" ]; then
  pkg_compile
  pkg_install
  pkg_config
elif [ "$1" == "remove" ]; then
  pkg_uninstall
fi
