source './homebrew.sh'
source './shellwreck.sh'
source './vimwreck.sh'
source './apps/registry.sh'

function install_apps {
  install_or_upgrade_package ack
  install_or_upgrade_package bash
  install_or_upgrade_package bash-completion
  install_or_upgrade_package fasd
  install_or_upgrade_package git-extras
  install_or_upgrade_package git-flow
  install_or_upgrade_package proctools
  install_or_upgrade_package python
  install_or_upgrade_package reattach-to-user-namespace
  install_or_upgrade_package the_silver_searcher
  install_or_upgrade_package tmux
  install_or_upgrade_package zsh

  install_adium
  install_dash
  install_dropbox
  install_firefox
  install_firefox "nightly"
  install_flux
  install_git
  install_gitx
  install_google_chrome
  install_google_chrome "canary"
  install_gpg
  install_iterm
  install_little_snitch
  install_macvim
  install_one_password
  install_pagekite
  install_screenflow
  install_screenhero
  install_sizeup
  install_sublime_text
  install_undercover
  install_vagrant
  install_viscosity

  install_shellwreck
  install_vimwreck
}
