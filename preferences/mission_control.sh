################################################################################
#                               Mission Control
################################################################################

# Toggle the Visibility of the Dashboard as a Space in Mission Control
function osx_mission_control_dashboard_visibility {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  defaults write com.apple.dock dashboard-in-overlay -bool $enabled
}

# Toggle Whether Multiple Windows for an App are Grouped Together in Mission Control
function osx_mission_control_group_by_app {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dock expose-group-by-app -bool $enabled
}

# Set the Speed of Transitioning Into and Out of Mission Control
function osx_mission_control_animation {
  local value="$1"; shift 1;

  defaults write com.apple.dock expose-animation-duration -float $value
}
