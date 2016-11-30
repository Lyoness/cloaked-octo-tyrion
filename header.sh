#!/bin/bash
travis_configure_php_mysql56() {
  if ! grep -qE '^socket = /run/mysql-5.6' ~/.my.cnf; then
    return
  fi

  MYSQL_UNIX_PORT="$(grep ^socket ~/.my.cnf | cut -d= -f2 | tr -d ' ')"
  export MYSQL_UNIX_PORT

  if [[ -d ~/.phpenv/versions ]]; then
    find ~/.phpenv/versions -name php.ini \
      | while read -r ini_file; do
        sed -i "/^[a-z_]*mysql.*socket/s:\$: ${MYSQL_UNIX_PORT}:" "${ini_file}"
      done
  fi

  if [[ -f '/etc/hhvm/php.ini' ]]; then
    echo "
pdo_mysql.default_socket = ${MYSQL_UNIX_PORT}
mysqli.default_socket = ${MYSQL_UNIX_PORT}
hhvm.mysql.socket = ${MYSQL_UNIX_PORT}
" | tee -a '/etc/hhvm/php.ini' >/dev/null
  fi
}
