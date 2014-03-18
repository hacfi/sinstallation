################################################################################
#                                  Scrolling
################################################################################

# Modify 'natural' mouse scrolling (enable or disable). Requires re-login.
function osx_scrolling_move_content {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool $enabled
}

# Sets the Scrollbar Mode
function osx_scrolling_bars {
  local mode;

  case "$1" in
  automatic)
    mode="Automatic";;
  manual)
    mode="Manual";;
  *)
    mode="$1";;
  esac

  defaults write NSGlobalDomain AppleShowScrollBars $mode
}

function osx_scrolling_bounce {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  sudo defaults write /Library/Preferences/.GlobalPreferences NSScrollViewRubberbanding -bool $enabled
}

function osx_scrolling_smooth {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  # Internal Trackpad
  defaults write NSGlobalDomain AppleScrollAnimationEnabled -bool $enabled
  defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool $enabled

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool $enabled

  # Mouse
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -bool $enabled
}

# Set the delay before the windows contents begins to scroll when you drag content to the edge
function osx_scrolling_autoscroll_delay {
  local delay="$1"; shift 1;

  defaults write -g NSDraggingAutoscrollDelay -float $delay
}
