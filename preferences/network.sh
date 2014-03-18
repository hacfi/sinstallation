################################################################################
#                                   Network
################################################################################

function osx_network_stop_bonjour_advertisements {
  sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"
}

# Toggle the Creation of .DS_Store Files on Network Volumes
function osx_network_dsstores {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  if [[ "$enabled" == "true" ]]; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores true
  else
    defaults delete com.apple.desktopservices DSDontWriteNetworkStores
  fi
}

# Toggles Whether to Allow Guest Access to Shared Folders
function osx_network_guest {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool $enabled
  sudo defaults write /Library/Preferences/com.apple.smb.server AllowGuestAccess -bool $enabled
}

# Set or Remove Custom Default Name Setting
function osx_network_default_login_name {
  local value="$1"; shift 1;

  if [[ "$value" == "" ]]; then
    defaults delete com.apple.NetworkAuthorization UseDefaultName
    defaults delete com.apple.NetworkAuthorization DefaultName
  else
    defaults write com.apple.NetworkAuthorization UseDefaultName -bool true
    defaults write com.apple.NetworkAuthorization DefaultName $value
  fi
}

# Set Wake on Ethernet
function osx_network_wake_on_ethernet {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  sudo pmset -a womp $enabled
  sudo pmset -a ring $enabled
}

# Toggle whether faxes may be received
function osx_network_faxes {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  if [[ "$enabled" == "enabled" ]]; then
    sudo sh -c "launchctl load -w /System/Library/LaunchDaemons/com.apple.efax.plist 2> /dev/null"
  else
    sudo sh -c "launchctl unload -w /System/Library/LaunchDaemons/com.apple.efax.plist 2> /dev/null"
  fi
}
