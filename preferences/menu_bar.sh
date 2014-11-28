################################################################################
#                                   Menu Bar
################################################################################

# Toggle Whether to Show the AirPlay Mirroring Icon in the Menu Bar
function osx_menu_bar_airplay {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.airplay showInMenuBarIfPresent -bool $enabled
}

# Toggle Menu Bar Transparency
function osx_menu_bar_transparency {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool $enabled
}

# Sets the Format of the Date in the Menu Bar
function osx_menu_bar_date {
  local format="$1"; shift 1;

  defaults write com.apple.menuextra.clock DateFormat -string "$format"
}

# Switch to dark menu bar in full screen mode
function osx_menu_bar_invert_in_full_screen_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write NSGlobalDomain NSFullScreenDarkMenu -bool $enabled
}
