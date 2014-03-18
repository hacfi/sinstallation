################################################################################
#                                    Spaces    
################################################################################

function osx_spaces_sort_by_most_recently_used {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.dock mru-spaces -bool $enabled
}

function osx_spaces_animation {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  defaults write com.apple.dock workspaces-swoosh-animation-off -bool $enabled
}

# When switching to an applicaiton, toggle whether OS will switch to a
# space containing an already active window for the application
function osx_spaces_switch_on_app_activation {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool $enabled
  defaults write com.apple.dock workspaces-auto-swoosh -bool $enabled
}

function osx_spaces_displays_have_separate_spaces {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  defaults write com.apple.spaces spans-displays -bool $enabled
}
