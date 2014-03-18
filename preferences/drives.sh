################################################################################
#                                   Drives
################################################################################

# Toggle the sudden motion sensor (it’s not useful for SSDs)
function osx_drives_sudden_motion_sensor {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  sudo pmset -a sms $enabled
}

function osx_drives_autoplay_action {
  local action;

  case "$1" in
  disabled)
    action="1";;
  *)
    action="$1";;
  esac

  # Blank CD automatic action.
  sudo defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.blank.cd.appeared -dict action $action

  # Music CD automatic action.
  sudo defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.cd.music.appeared -dict action $action

  # Picture CD automatic action.
  sudo defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.cd.picture.appeared -dict action $action

  # Blank DVD automatic action.
  sudo defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.blank.dvd.appeared -dict action $action

  # Video DVD automatic action.
  sudo defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.dvd.video.appeared -dict action $action
}

function osx_drives_disable_autoplay {
  osx_drives_autoplay_action disabled
}

# Toggle DVD or CD Sharing.
function osx_drives_remote_sharing {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local loaded; if [[ "$1" == "enabled" ]]; then loaded="load"; else loaded="unload"; fi; shift 1;

  defaults write com.apple.NetworkBrowser ODSSupported -bool $enabled
  defaults write com.apple.NetworkBrowser EnableODiskBrowsing -bool $enabled
  sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.ODSAgent.plist 2> /dev/null"
}
