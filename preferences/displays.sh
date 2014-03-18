################################################################################
#                                 Displays        
################################################################################

# Toggle Whether Brightness is Automatically Adjusted Depending on Ambient Light
function osx_displays_auto_brightness_adjustment {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -int $enabled
}
