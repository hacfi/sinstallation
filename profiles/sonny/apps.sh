source './apps/installers.sh'

function install_apps {
  install_or_upgrade_app    'omnigraffle'
  install_mac_app_store_app 'Todo Pro.app'
  install_or_upgrade_app    'spotify'
  install_or_upgrade_app    'alfred'
}
