################################################################################
#                               Screen Sharing
################################################################################

function osx_screen_sharing {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi
  local loaded; if [[ "$1" == "enabled" ]]; then loaded="load"; else loaded="unload"; fi

  sudo defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool $enabled
  sudo sh -c "launchctl $loaded /System/Library/LaunchDaemons/com.apple.screensharing.plist 2> /dev/null"
}

function osx_screen_sharing_unencrypted_connection_warnings {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  defaults write com.apple.ScreenSharing dontWarnOnVNCEncryption -bool $enabled
}
