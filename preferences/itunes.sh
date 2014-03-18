################################################################################
#                                    iTunes
################################################################################

# Toggle Whether iTunes Automatically Backs Up Device on Sync
function osx_itunes_automatic_device_backup_when_syncing {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  defaults write com.apple.iTunes AutomaticDeviceBackupsDisabled -bool $enabled
}

# Toggle Whether iPods and iPhones Sync Automatically When Connected
function osx_itunes_automatic_sync {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  defaults write com.apple.iTunes dontAutomaticallySyncIPods -bool $enabled
}

# Stop iTunes from responding to the keyboard media keys
function osx_itunes_media_key_access {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  if [[ "$enabled" == "enabled" ]]; then
    launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
  else
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
  fi
}
