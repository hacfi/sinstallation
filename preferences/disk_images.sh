################################################################################
#                                Disk Images      
################################################################################

# Toggles Whether the Disk Images are Auto-Mounted
function osx_disk_images_auto_mount {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool $enabled
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool $enabled
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool $enabled
}

# Toggle the Verification of Disk Images
function osx_disk_images_verification {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  defaults write com.apple.frameworks.diskimages skip-idme -bool $enabled
  defaults write com.apple.frameworks.diskimages skip-verify -bool $enabled
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool $enabled
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool $enabled
}
