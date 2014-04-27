################################################################################
#                                   Debug
################################################################################

# Toggle Debug Mode
function osx_debug_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  # Toggle Disk Utility Debug Mode
  defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool $enabled
  defaults write com.apple.diskcopy expert-mode -bool $enabled

  # Toggle Address Book Debug Mode
  defaults write com.apple.addressbook ABShowDebugMenu -bool $enabled

  # Toggle Calendar Debug Mode
  defaults write com.apple.iCal IncludeDebugMenu -bool $enabled

  # Toggle Safari Debug Mode
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool $enabled

  # Toggle App Store Debug Mode
  defaults write com.apple.appstore ShowDebugMenu -bool $enabled
  defaults write com.apple.appstore WebKitDeveloperExtras -bool $enabled

  # Toggle Help Viewer Debug Mode
  defaults write com.apple.helpviewer DevMode -bool $enabled

  # Toggle Developer Extras in All Web Views
  sudo defaults write NSGlobalDomain WebKitDeveloperExtras -bool $enabled

  # Toggle iBooks Debug Mode
  defaults write com.apple.iBooksX BKShowDebugMenu -bool $enabled

  # Toggle Finder Debug Mode
  defaults write com.apple.finder ShowDebugMenu -bool $enabled

  # Toggle PhotoBooth Debug Mode
  defaults write com.apple.PhotoBooth EnableDebugMenu -bool $enabled

  # Toggle Reminders Debug Mode
  defaults write com.apple.reminders RemindersDebugMenu -bool $enabled

  # Toggle ScreenSharing Debug Mode
  defaults write com.apple.ScreenSharing debug -bool $enabled

  # Toggle TimeMachine Debug Mode
  defaults write com.apple.Backup IncludeDebugMenu -bool $enabled
}
