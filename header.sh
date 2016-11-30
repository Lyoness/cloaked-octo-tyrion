#!/bin/bash
travis_configure_php_mysql56() {
  if ! grep -qE '^socket = /run/mysql-5.6' $HOME/.my.cnf; then
    return
  fi

  local mysql_unix_port
  mysql_unix_port="$(grep ^socket $HOME/.my.cnf)"
  mysql_unix_port="${mysql_unix_port##*=}"
  mysql_unix_port="${mysql_unix_port// /}"

  export MYSQL_UNIX_PORT="${mysql_unix_port}"

  if [[ -d $HOME/.phpenv/versions ]]; then
    find $HOME/.phpenv/versions -name php.ini \
      | while read -r ini_file; do
        sed -i "/^[a-z_]*mysql.*socket/s:\$: ${MYSQL_UNIX_PORT}:" "${ini_file}"
      done
  fi

  if [[ -f '//etc/hhvm/php.ini' ]]; then
    echo "
pdo_mysql.default_socket = ${MYSQL_UNIX_PORT}
mysqli.default_socket = ${MYSQL_UNIX_PORT}
hhvm.mysql.socket = ${MYSQL_UNIX_PORT}
" | sudo tee -a '//etc/hhvm/php.ini' >/dev/null
  fi
}
