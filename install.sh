#!/bin/sh

source "./bootstrap.sh"

install_profile kompanee
install_profile `whoami`

secure

source "./post_install.sh"
