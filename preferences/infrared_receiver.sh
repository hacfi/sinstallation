################################################################################
#                              Infrared Receiver
################################################################################

# Toggle remote control infrared receiver
function osx_ir_receiver {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool $enabled
}
