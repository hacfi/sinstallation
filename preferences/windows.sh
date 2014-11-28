################################################################################
#                                  Windows
################################################################################

# Miniaturize Windows on Double-Click
function osx_windows_miniaturize_on_double_click {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -int $enabled
}

# Toggle Single App Mode
function osx_windows_single_app_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock single-app -bool $enabled
}
