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

ini_file_addition='
pdo_mysql.default_socket = __MYSQL56SOCKET__
mysqli.default_socket = __MYSQL56SOCKET__
hhvm.mysql.socket = __MYSQL56SOCKET__
'
echo "${ini_file_addition}" | tee -a '/etc/hhvm/php.ini' >/dev/null
sed -i "s,__MYSQL56SOCKET__,$(grep ^socket ~/.my.cnf | cut -d= -f2 | tr -d ' '),g" '/etc/hhvm/php.ini' >/dev/null
