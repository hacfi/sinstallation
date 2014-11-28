################################################################################
#                                    Dock
################################################################################

# Dim hidden apps
function osx_dock_hidden_app_dimming {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock showhidden -bool $enabled
}

# Toggle Indicator Lights Under Running Applications
function osx_dock_indicator_lights {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock show-process-indicators -bool $enabled
}

# Display iTunes Notifications on the Dock
function osx_dock_itunes_notifications {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock itunes-notifications -bool $enabled
  defaults write com.apple.dock notification-always-show-image -bool $enabled
}

# Toggles Whether to Only Show Running Application in the Dock
function osx_dock_only_show_running_apps {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock static-only -bool $enabled
}

# Automatically hide the dock
function osx_dock_autohide {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local delay="$1"; shift 1;
  local speed="$1"; shift 1;

  defaults write com.apple.dock autohide -bool $enabled

  # Set the delay when auto-hiding the dock
  if [[ "$delay" != "" ]]; then
    defaults write com.apple.dock autohide-delay -float $delay
  fi

  if [[ "$speed" != "" ]]; then
    defaults write com.apple.dock autohide-time-modifier -float $speed
  fi
}

# Clears the dock of 'pinned' icons.
#
# Prevent launchpad from reappearing
# Remove all the pinned icons
function osx_dock_clear {
  defaults write com.apple.dock checked-for-launchpad -bool true
  defaults write com.apple.dock persistent-apps -array ""
  defaults write com.apple.dock persistent-others -array ""

  rm -f $HOME/Library/Application\ Support/Dock/*.db 2> /dev/null && killall Dock

  for (( i = 0; i < 5; i++ )); do
    echo "."; sleep 1
    echo "."; sleep 1
  done

  echo ""

  sqlite3 $HOME/Library/Application\ Support/Dock/*-*.db "DELETE FROM apps; DELETE FROM groups WHERE rowid>2; DELETE FROM items WHERE rowid>4; DELETE FROM widgets;" && killall Dock
}

# Disables the dock by setting a long autohide-delay
function osx_dock_disable {
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 999999
}

# Toggle the Bouncing Application Icon on Launch
function osx_dock_icon_bounce_on_app_launch {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.dock launchanim -bool $enabled
}

# Toggle the Bouncing Application Icon on Activity
function osx_dock_icon_bounce_on_app_activity {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  defaults write com.apple.dock no-bouncing -bool $enabled
}

# Sets the Size of the Icons in Pixels
function osx_dock_icon_size {
  local size="$1"; shift 1;

  defaults write com.apple.dock tilesize -int $size
}

# Toggles Whether the Icons Magnify as the Cursor Gets Closer
# Sets the Size of the Icons in Pixels when the Icon is Magnified
function osx_dock_magnification {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi; shift 1;
  local icon_size="$1"; shift 1;

  defaults write com.apple.dock magnification -int $enabled

  if [[ "$icon_size" != "" ]]; then
    defaults write com.apple.dock largesize -int $icon_size
  fi
}

# Set the Position of the Dock Relative to the Desktop
#
# Mode: top | right | bottom | left
# Mode: start | middle | end
function osx_dock_orientation {
  local orientation="$1"; shift 1;
  local pinning="$1"; shift 1;

  defaults write com.apple.dock orientation $orientation
  defaults write com.apple.dock pinning -string $pinning
}

# Toggle the delay for showing the Dock in full screen
function osx_dock_full_screen_delay {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.dock autohide-fullscreen-delayed -bool $enabled
}
