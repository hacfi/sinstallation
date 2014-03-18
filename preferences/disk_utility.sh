################################################################################
#                                Disk Utility     
################################################################################

# Toggle Advanced Image Options in Disk Utility
function osx_disk_utility_advanced_image_options {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  defaults write com.apple.DiskUtility advanced-image-options -int $enabled
}

# Toggle the Visibility of Hidden Partitions in Disk Utility
function osx_disk_utility_hidden_partitions {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  defaults write com.apple.DiskUtility DUShowEveryPartition -int $enabled
}

# Toggle whether to show unsupported networks in Disk Utility
function osx_disk_utility_unsupported_networks {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.DiskUtility DUShowUnsupportedNetworks -bool $enabled
}
