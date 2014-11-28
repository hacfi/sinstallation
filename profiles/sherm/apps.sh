source './apps/installers.sh'

function install_apps {
  # install_adobe_creative_suite
  install_or_upgrade_app    'coda'
  install_or_upgrade_app    'codekit'
  install_or_upgrade_app    'handbrake'
  install_mac_app_store_app 'Kindle.app'
  install_or_upgrade_app    'launchbar'
  install_or_upgrade_app    'macpar-deluxe'
  install_or_upgrade_app    'mplayerx'
  install_mac_app_store_app 'Pocket.app'
  install_mac_app_store_app 'Shush.app'
  install_or_upgrade_app    'spotify'
  install_or_upgrade_app    'utorrent-beta'
}
