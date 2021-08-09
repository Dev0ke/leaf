#!/bin/bash

pkg_prepare() {
  install  -v -m700 -d /var/lib/sshd &&
  chown    -v root:sys /var/lib/sshd &&

  groupadd -g 50 sshd        &&
  useradd  -c 'sshd PrivSep' \
           -d /var/lib/sshd  \
           -g sshd           \
           -s /bin/false     \
           -u 50 sshd

  ./configure --prefix=/usr                     \
              --sysconfdir=/etc/ssh             \
              --with-md5-passwords              \
              --with-privsep-path=/var/lib/sshd
}

pkg_compile() {
  make
}

pkg_install() {
  make install
  install -v -m755    contrib/ssh-copy-id /usr/bin     &&

  install -v -m644    contrib/ssh-copy-id.1 \
                      /usr/share/man/man1              &&
  install -v -m755 -d /usr/share/doc/openssh-8.3p1     &&
  install -v -m644    INSTALL LICENCE OVERVIEW README* \
                      /usr/share/doc/openssh-8.3p1
}

pkg_config() {
  echo "PermitRootLogin no" >> /etc/ssh/sshd_config

  sed 's@d/login@d/sshd@g' /etc/pam.d/login > /etc/pam.d/sshd &&
  chmod 644 /etc/pam.d/sshd &&
  echo "UsePAM yes" >> /etc/ssh/sshd_config

  cat << EOF
*************************************************************************
* If you would like to now disable password logins, as the root user:   *
* # echo "PasswordAuthentication no" >> /etc/ssh/sshd_config            *
* # echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config   *
*************************************************************************
EOF

  cd ${SYSTEMD_DIR}
  make install-sshd
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
