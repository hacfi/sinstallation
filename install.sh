#!/bin/sh

source "./bootstrap.sh"
source "./post_install.sh"

install_profile kompanee
install_profile `whoami`

secure
post_install
