################################################################################
#                                  Location     
################################################################################

function osx_location {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi
  local loaded; if [[ "$1" == "enabled" ]]; then loaded="load"; else loaded="unload"; fi

  defaults write com.apple.MCX DisableLocationServices -bool $enabled
  sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.locationd.plist 2> /dev/null"
}
