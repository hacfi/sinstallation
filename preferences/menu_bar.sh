################################################################################
#                                   Menu Bar
################################################################################

# Toggle Whether to Show the AirPlay Mirroring Icon in the Menu Bar
function osx_menu_bar_airplay {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.airplay showInMenuBarIfPresent -bool $enabled
}

# Sets the Format of the Date in the Menu Bar
function osx_menu_bar_date {
  local format="$1"; shift 1;

  defaults write com.apple.menuextra.clock DateFormat -string "$format"
}
