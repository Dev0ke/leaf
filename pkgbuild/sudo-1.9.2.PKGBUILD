#!/bin/bash

pkg_prepare() {
  ./configure --prefix=/usr              \
              --libexecdir=/usr/lib      \
              --with-secure-path         \
              --with-all-insults         \
              --with-env-editor          \
              --docdir=/usr/share/doc/sudo-1.9.2 \
              --with-passprompt="[sudo] password for %p: "
}

pkg_compile() {
  make
}

pkg_install() {
  make install &&
  ln -sfv libsudo_util.so.0.0.0 /usr/lib/sudo/libsudo_util.so.0
}

pkg_config() {
  cat > /etc/sudoers.d/sudo << "EOF"
Defaults secure_path="/usr/bin:/bin:/usr/sbin:/sbin"
%wheel ALL=(ALL) ALL
EOF

  cat > /etc/pam.d/sudo << "EOF"
# Begin /etc/pam.d/sudo

# include the default auth settings
auth      include     system-auth

# include the default account settings
account   include     system-account

# Set default environment variables for the service user
session   required    pam_env.so

# include system session defaults
session   include     system-session

# End /etc/pam.d/sudo
EOF
  chmod 644 /etc/pam.d/sudo
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
