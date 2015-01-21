source './apps/installers.sh'

function install_apps {
  install_or_upgrade_app    'launchbar'
  install_or_upgrade_app    'mplayerx'
  install_mac_app_store_app 'Pocket.app'
}
