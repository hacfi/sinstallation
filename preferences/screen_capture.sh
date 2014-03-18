################################################################################
#                               Screen Capture      
################################################################################

function osx_screen_capture {
  local format="$1"; shift 1;
  local location="$1"; shift 1;
  local add_shadow; if [[ "$1" == "enabled" ]]; then add_shadow="false"; else add_shadow="true"; fi; shift 1;
  local base_name="$1"; shift 1;

  # Sets the Format of Images Taken With Screen Capture
  defaults write com.apple.screencapture type $format

  # Sets the Location of Images Taken With Screen Capture
  defaults write com.apple.screencapture location $location

  # Sets the Base Filename Used for Screenshots
  defaults write com.apple.screencapture name $base_name

  # Toggles Whether Images Taken With Screen Capture Include Drop Shadows
  defaults write com.apple.screencapture disable-shadow -bool $add_shadow
}
