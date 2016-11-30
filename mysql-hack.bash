#!/usr/bin/env bash

set -o errexit
set -o xtrace
set -o pipefail

source header.sh
travis_configure_php_mysql56
