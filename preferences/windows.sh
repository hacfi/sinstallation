################################################################################
#                                  Windows  
################################################################################

# Miniaturize Windows on Double-Click
function osx_windows_miniaturize_on_double_click {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -int $enabled
}

function osx_windows_animations {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local resize_duration="$1"; shift 1;

  # Toggle Open/Close Window Animations
  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool $enabled

  # Sets the Length of Time in Seconds When a Window is Resized
  if [[ "$resize_duration" != "" ]]; then
    defaults write NSGlobalDomain NSWindowResizeTime -float $resize_duration
  fi
}

# Toggle Single App Mode
function osx_windows_single_app_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock single-app -bool $enabled
}
