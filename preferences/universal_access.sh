################################################################################
#                              Universal Access
################################################################################

# Public: Enable use of mousewheel for zooming.
# Use mouse wheel (scroll gesture) to zoom
function osx_universal_access_scrollwheel_zoom {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool $enabled
}

# Toggle Whether the Screen Flashes When an Alert Occurs
function osx_universal_access_flash_screen {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  defaults write com.apple.universalaccess flashScreen $enabled
}

function osx_universal_access_assistive_device_access {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local universal_access_device_access_file='/private/var/db/.AccessibilityAPIEnabled'

  if [[ "$enabled" == "enabled" ]]; then
    sudo sh -c "echo 'a' > $universal_access_device_access_file"
    sudo chown root:wheel $universal_access_device_access_file
    sudo chmod 444 $universal_access_device_access_file
  else
    sudo sh -c "rm -f $universal_access_device_access_file 2> /dev/null"
  fi
}

# Use scroll gesture with the Ctrl (^) key to zoom
function osx_universal_access_ctrl_mod_zoom {
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask 262144
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask 262144
}

# Sets the size of the cursor.
#
# zoom - the factor by which the cursor will be zoomed. Defaults to 1.5.
function osx_universal_access_cursor_size {
  local value="$1"; shift 1;

  defaults write com.apple.universalaccess mouseDriverCursorSize $value
}
