################################################################################
#                                  Location
################################################################################

function osx_location {
  local enabled;     if [[ "$1" == "enabled" ]]; then enabled="true";  else enabled="false"; fi
  local enabled_neg; if [[ "$1" == "enabled" ]]; then enabled_neg="false"; else enabled_neg="true"; fi
  local loaded;      if [[ "$1" == "enabled" ]]; then loaded="load";   else loaded="unload"; fi

  defaults write com.apple.MCX DisableLocationServices -bool $enabled_neg
  defaults -currentHost write com.apple.locationd LocationServicesEnabled -bool $enabled

  sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.locationd.plist 2> /dev/null"
}
