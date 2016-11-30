#!/usr/bin/env bash

set -o errexit
set -o xtrace
set -o pipefail

MYSQL_UNIX_PORT="$(grep ^socket ~/.my.cnf | cut -d= -f2 | tr -d ' ')"
export MYSQL_UNIX_PORT

find ~/.phpenv/versions -name php.ini \
  | while read -r ini_file; do
    sed -i "/^[a-z_]*mysql.*socket/s:\$: ${MYSQL_UNIX_PORT}:" "${ini_file}"
  done

ini_file_addition="
pdo_mysql.default_socket = ${MYSQL_UNIX_PORT}
mysqli.default_socket = ${MYSQL_UNIX_PORT}
hhvm.mysql.socket = ${MYSQL_UNIX_PORT}
"
echo "${ini_file_addition}" | tee -a '/etc/hhvm/php.ini' >/dev/null
